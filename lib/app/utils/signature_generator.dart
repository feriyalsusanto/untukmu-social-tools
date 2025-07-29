import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignatureGenerator {
  static String generatePayloadToSignature({
    required String method,
    dynamic payload,
    required String timestamp,
    bool isDev = false,
  }) {
    String payloadToSignature = '';

    if (method == "GET") {
      // For GET requests
      if (payload is String) {
        // Tambahkan timestamp ke URL query
        String url = payload;
        if (url.contains('?')) {
          url = '$url&timestamp=$timestamp';
        } else {
          url = '$url?timestamp=$timestamp';
        }

        // Parse query menjadi map
        Uri uri = Uri.parse(url);
        Map<String, String> queryParams = uri.queryParameters;

        // Encode queryParams ke JSON
        payloadToSignature = json.encode(queryParams);
      } else {
        // Jika payload bukan string mungkin hanya gunakan timestamp saja
        payloadToSignature = json.encode({"timestamp": timestamp});
      }
    } else {
      // For other methods (POST, PUT, etc.)
      // Kita pastikan data yang akan disign adalah Map agar bisa disisipkan timestamp
      Map<String, dynamic> payloadMap = {};

      if (payload is Map<String, dynamic>) {
        // Jika memang payload sudah Map
        payloadMap = Map<String, dynamic>.from(payload);
      } else {
        // Jika payload bukan map (mis: FormData, String, dll), buat map baru berisi timestamp saja
        // atau jika butuh data payload, ubah logika ini sesuai kebutuhan.
      }

      // Tambahkan timestamp ke payloadMap
      payloadMap['timestamp'] = timestamp;

      // Encode payloadMap ke JSON
      payloadToSignature = json.encode(payloadMap);
    }

    debugPrint('payloadToSignature $payloadToSignature');

    // Ambil secret key dari env
    String message =
        isDev ? dotenv.env['API_SECRET_DEV']! : dotenv.env['API_SECRET']!;
    List<int> key = utf8.encode(message);
    List<int> bytes = utf8.encode(payloadToSignature);

    Hmac hmac = Hmac(sha256, key);
    Digest digest = hmac.convert(bytes);

    return digest.toString();
  }
}
