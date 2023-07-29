import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:travel_byte/shared/theme.dart';

class FillButton extends StatelessWidget {
  const FillButton({
    super.key,
    this.child,
    this.text,
    required this.onPress,
    this.color,
    this.textStyle,
  });

  final VoidCallback onPress;
  final Widget? child;
  final String? text;
  final Color? color;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        side: const BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor:
            color ?? AdaptiveTheme.of(context).theme.colorScheme.primary,
        textStyle:
            textStyle ?? AdaptiveTheme.of(context).theme.textTheme.bodySmall,
      ),
      onPressed: onPress,
      child: child == null ? Text(text ?? "", style: whiteTextStyle) : child!,
    );
  }
}
