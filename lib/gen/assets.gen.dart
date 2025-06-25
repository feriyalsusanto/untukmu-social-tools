/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_head_dashed.svg
  SvgGenImage get arrowHeadDashed =>
      const SvgGenImage('assets/icons/arrow_head_dashed.svg');

  /// File path: assets/icons/arrow_right.svg
  SvgGenImage get arrowRight =>
      const SvgGenImage('assets/icons/arrow_right.svg');

  /// File path: assets/icons/chart_success.svg
  SvgGenImage get chartSuccess =>
      const SvgGenImage('assets/icons/chart_success.svg');

  /// File path: assets/icons/clipboard_text.svg
  SvgGenImage get clipboardText =>
      const SvgGenImage('assets/icons/clipboard_text.svg');

  /// File path: assets/icons/disconnect_x.svg
  SvgGenImage get disconnectX =>
      const SvgGenImage('assets/icons/disconnect_x.svg');

  /// File path: assets/icons/eye_slash.svg
  SvgGenImage get eyeSlash => const SvgGenImage('assets/icons/eye_slash.svg');

  /// File path: assets/icons/google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/google.svg');

  /// File path: assets/icons/layer.svg
  SvgGenImage get layer => const SvgGenImage('assets/icons/layer.svg');

  /// File path: assets/icons/person_filled.svg
  SvgGenImage get personFilled =>
      const SvgGenImage('assets/icons/person_filled.svg');

  /// File path: assets/icons/sms.svg
  SvgGenImage get sms => const SvgGenImage('assets/icons/sms.svg');

  /// File path: assets/icons/sparkle_blue.svg
  SvgGenImage get sparkleBlue =>
      const SvgGenImage('assets/icons/sparkle_blue.svg');

  /// File path: assets/icons/star.svg
  SvgGenImage get star => const SvgGenImage('assets/icons/star.svg');

  /// File path: assets/icons/stash_question.svg
  SvgGenImage get stashQuestion =>
      const SvgGenImage('assets/icons/stash_question.svg');

  /// File path: assets/icons/trend_up.svg
  SvgGenImage get trendUp => const SvgGenImage('assets/icons/trend_up.svg');

  /// File path: assets/icons/wallet.svg
  SvgGenImage get wallet => const SvgGenImage('assets/icons/wallet.svg');

  /// File path: assets/icons/x_twitter.svg
  SvgGenImage get xTwitter => const SvgGenImage('assets/icons/x_twitter.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrowHeadDashed,
    arrowRight,
    chartSuccess,
    clipboardText,
    disconnectX,
    eyeSlash,
    google,
    layer,
    personFilled,
    sms,
    sparkleBlue,
    star,
    stashQuestion,
    trendUp,
    wallet,
    xTwitter,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_login.png
  AssetGenImage get backgroundLogin =>
      const AssetGenImage('assets/images/background_login.png');

  /// File path: assets/images/background_wallet.svg
  SvgGenImage get backgroundWallet =>
      const SvgGenImage('assets/images/background_wallet.svg');

  /// File path: assets/images/background_wallet_image.png
  AssetGenImage get backgroundWalletImage =>
      const AssetGenImage('assets/images/background_wallet_image.png');

  /// File path: assets/images/badges_default.png
  AssetGenImage get badgesDefault =>
      const AssetGenImage('assets/images/badges_default.png');

  /// File path: assets/images/chrome_star.png
  AssetGenImage get chromeStar =>
      const AssetGenImage('assets/images/chrome_star.png');

  /// File path: assets/images/coin.png
  AssetGenImage get coin => const AssetGenImage('assets/images/coin.png');

  /// File path: assets/images/colorful_sparkle.png
  AssetGenImage get colorfulSparkle =>
      const AssetGenImage('assets/images/colorful_sparkle.png');

  /// File path: assets/images/default_profile_picture.png
  AssetGenImage get defaultProfilePicture =>
      const AssetGenImage('assets/images/default_profile_picture.png');

  /// File path: assets/images/impact_background.png
  AssetGenImage get impactBackground =>
      const AssetGenImage('assets/images/impact_background.png');

  /// File path: assets/images/solana_logo.png
  AssetGenImage get solanaLogo =>
      const AssetGenImage('assets/images/solana_logo.png');

  /// List of all assets
  List<dynamic> get values => [
    backgroundLogin,
    backgroundWallet,
    backgroundWalletImage,
    badgesDefault,
    chromeStar,
    coin,
    colorfulSparkle,
    defaultProfilePicture,
    impactBackground,
    solanaLogo,
  ];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
