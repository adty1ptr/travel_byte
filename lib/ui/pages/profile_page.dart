import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Profile Page",
          style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
