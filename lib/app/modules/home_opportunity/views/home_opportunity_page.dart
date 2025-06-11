import 'package:flutter/material.dart';

class HomeOpportunityPage extends StatefulWidget {
  const HomeOpportunityPage({super.key});

  @override
  State<HomeOpportunityPage> createState() => _HomeOpportunityPageState();
}

class _HomeOpportunityPageState extends State<HomeOpportunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home Opportunity')));
  }
}
