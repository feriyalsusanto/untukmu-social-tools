import 'dart:math';

enum BlockchainType { bitcoin, ethereum, solana, cardano, polkadot, generic }

class CryptoAddressGenerator {
  static final Random _random = Random();

  // Bitcoin character set (Base58)
  static const String _base58Chars =
      '123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

  // Ethereum/Hex character set
  static const String _hexChars = '0123456789abcdef';

  // Alphanumeric character set
  static const String _alphaNumericChars =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  /// Generate a Bitcoin-like address (Base58, starts with 1 or 3)
  /// Default length: 26-35 characters
  static String generateBitcoinAddress({int? length}) {
    length ??= 26 + _random.nextInt(10); // Random length between 26-35

    // Bitcoin addresses typically start with '1' or '3'
    String prefix = _random.nextBool() ? '1' : '3';

    String address = prefix;
    for (int i = 1; i < length; i++) {
      address += _base58Chars[_random.nextInt(_base58Chars.length)];
    }

    return address;
  }

  /// Generate an Ethereum-like address (Hex, starts with 0x)
  /// Default length: 42 characters (including 0x prefix)
  static String generateEthereumAddress() {
    String address = '0x';

    for (int i = 0; i < 40; i++) {
      address += _hexChars[_random.nextInt(_hexChars.length)];
    }

    return address;
  }

  /// Generate a Solana-like address (Base58, 44 characters)
  static String generateSolanaAddress() {
    String address = '';

    for (int i = 0; i < 44; i++) {
      address += _base58Chars[_random.nextInt(_base58Chars.length)];
    }

    return address;
  }

  /// Generate a generic crypto-like address
  /// @param length: Address length (default: 34)
  /// @param prefix: Optional prefix (e.g., '0x', 'bc1', etc.)
  /// @param useBase58: Use Base58 encoding instead of hex
  static String generateGenericAddress({
    int length = 34,
    String? prefix,
    bool useBase58 = false,
  }) {
    String chars = useBase58 ? _base58Chars : _alphaNumericChars;
    String address = prefix ?? '';

    int remainingLength = length - address.length;

    for (int i = 0; i < remainingLength; i++) {
      address += chars[_random.nextInt(chars.length)];
    }

    return address;
  }

  /// Generate a Cardano-like address (Bech32 style, starts with addr1)
  static String generateCardanoAddress() {
    String address = 'addr1';

    // Cardano addresses are typically around 100+ characters
    for (int i = 0; i < 100; i++) {
      address += _alphaNumericChars[_random.nextInt(_alphaNumericChars.length)];
    }

    return address;
  }

  /// Generate a Polkadot-like address (SS58 format)
  static String generatePolkadotAddress() {
    String address = '';

    // Polkadot addresses are 47-48 characters in Base58
    for (int i = 0; i < 47; i++) {
      address += _base58Chars[_random.nextInt(_base58Chars.length)];
    }

    return address;
  }

  /// Generate a random address based on blockchain type
  static String generateByBlockchain(BlockchainType type) {
    switch (type) {
      case BlockchainType.bitcoin:
        return generateBitcoinAddress();
      case BlockchainType.ethereum:
        return generateEthereumAddress();
      case BlockchainType.solana:
        return generateSolanaAddress();
      case BlockchainType.cardano:
        return generateCardanoAddress();
      case BlockchainType.polkadot:
        return generatePolkadotAddress();
      case BlockchainType.generic:
        return generateGenericAddress();
    }
  }

  /// Generate multiple addresses at once
  static List<String> generateMultiple(BlockchainType type, {int count = 5}) {
    return List.generate(count, (_) => generateByBlockchain(type));
  }

  /// Generate a formatted address with checksums (visual only, not cryptographically valid)
  static String generateWithChecksum(BlockchainType type) {
    String address = generateByBlockchain(type);

    // Add a simple visual checksum (last 4 characters in uppercase)
    if (address.length >= 4) {
      String base = address.substring(0, address.length - 4);
      String checksum = address.substring(address.length - 4).toUpperCase();
      return base + checksum;
    }

    return address;
  }

  /// Generate a secret/masked address format like: 0xF4c...a9B1
  /// Shows first few and last few characters with dots in between
  static String generateSecretAddress({
    BlockchainType type = BlockchainType.ethereum,
    int startChars = 3,
    int endChars = 4,
    String separator = '...',
  }) {
    String fullAddress = generateByBlockchain(type);
    return maskAddress(fullAddress, startChars, endChars, separator);
  }

  /// Mask an existing address to secret format
  /// @param address: Full address to mask
  /// @param startChars: Number of characters to show at start (after prefix)
  /// @param endChars: Number of characters to show at end
  /// @param separator: String to use between visible parts (default: '...')
  static String maskAddress(
    String address, [
    int startChars = 3,
    int endChars = 4,
    String separator = '...',
  ]) {
    if (address.length <= startChars + endChars) {
      return address; // Too short to mask
    }

    // Handle addresses with prefixes (like 0x)
    String prefix = '';
    String mainAddress = address;

    if (address.startsWith('0x')) {
      prefix = '0x';
      mainAddress = address.substring(2);
    } else if (address.startsWith('addr1')) {
      prefix = 'addr1';
      mainAddress = address.substring(5);
    }

    if (mainAddress.length <= startChars + endChars) {
      return address; // Main part too short to mask
    }

    String start = mainAddress.substring(0, startChars);
    String end = mainAddress.substring(mainAddress.length - endChars);

    return '$prefix$start$separator$end';
  }

  /// Generate multiple secret addresses
  static List<String> generateMultipleSecret(
    BlockchainType type, {
    int count = 5,
    int startChars = 3,
    int endChars = 4,
  }) {
    return List.generate(
      count,
      (_) => generateSecretAddress(
        type: type,
        startChars: startChars,
        endChars: endChars,
      ),
    );
  }

  /// Generate secret address with custom format options
  static String generateCustomSecret({
    BlockchainType type = BlockchainType.ethereum,
    int startChars = 3,
    int endChars = 4,
    String separator = '...',
    bool uppercaseEnd = true,
  }) {
    String fullAddress = generateByBlockchain(type);
    String masked = maskAddress(fullAddress, startChars, endChars, separator);

    if (uppercaseEnd && masked.contains(separator)) {
      List<String> parts = masked.split(separator);
      if (parts.length == 2) {
        String lastPart = parts[1];
        // Make last part uppercase (common in wallet displays)
        parts[1] = lastPart.toUpperCase();
        masked = parts.join(separator);
      }
    }

    return masked;
  }
}
