import 'package:flutter/material.dart';

class ReloadWidget extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final Color? iconColor;

  const ReloadWidget.empty({
    super.key,
    required this.content,
    this.onPressed,
    this.iconColor,
  });

  const ReloadWidget.error({
    super.key,
    required this.content,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          if (onPressed != null)
            Icon(
              Icons.refresh,
              color: iconColor ?? Colors.black,
            ),
        ],
      ),
    );
  }
}
