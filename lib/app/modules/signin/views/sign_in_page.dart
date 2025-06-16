import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F6),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Create Your Profile Passport',
                    style: TextStyle(fontSize: 20, color: Color(0xFF1F2937)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Track your influence, unlock badges, and get matched with real opportunities.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF4B5563)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.twitter,
                    label: 'Continue with X',
                  ),
                  SizedBox(height: 14),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.google,
                    label: 'Continue with Google',
                  ),
                  SizedBox(height: 14),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.envelope,
                    label: 'Continue with Email',
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 24),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      spacing: 12,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Color(0xFF374151),
                          size: 20,
                        ),
                        Expanded(
                          child: Text(
                            'Each method creates a lightweight Passport shell with a uid, and allows you to explore a demo version immediately.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By continuing, you agree to our ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: Color(0xFF374151),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF374151),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        foregroundColor: Color(0xFF1F2937),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xFFD1D5DB)),
        ),
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(icon, color: Color(0xFF1F2937), size: 16),
          Text(label, style: TextStyle(fontSize: 14, color: Color(0xFF1F2937))),
        ],
      ),
    );
  }
}
