import 'package:flutter/material.dart';
import 'package:mix/styles/styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    required this.child,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Function(bool)? onHover;
  final Function(bool)? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
    );
  }

  factory AppButton.primaryButton({
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    Function(bool)? onHover,
    Function(bool)? onFocusChange,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    Widget? child,
    double elevation = 5,
  }) =>
      AppButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        style: ButtonStyle(
          elevation: MaterialStatePropertyAll(elevation),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: AppCorners.lgBorder,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primaryColor,
          ),
        ),
        child: child,
      );
}
