import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class MyTicketPage extends StatefulWidget {
  const MyTicketPage({super.key});

  @override
  State<MyTicketPage> createState() => _MyTicketPageState();
}

class _MyTicketPageState extends State<MyTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "My Ticket Page",
          style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
