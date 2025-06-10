import 'package:flutter/material.dart';

class DeepLinkConnectPage extends StatefulWidget {
  const DeepLinkConnectPage({super.key, this.oauthToken, this.oauthVerifier});

  final String? oauthToken;
  final String? oauthVerifier;

  @override
  State<DeepLinkConnectPage> createState() => _DeepLinkConnectPageState();
}

class _DeepLinkConnectPageState extends State<DeepLinkConnectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deep Link Connect')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OAuth Token: ${widget.oauthToken}'),
            Text('OAuth Verifier: ${widget.oauthVerifier}'),
          ],
        ),
      ),
    );
  }
}
