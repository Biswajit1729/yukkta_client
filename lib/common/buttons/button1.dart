import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../color/index.dart';

class ButtonViewProfileProperties {
  final double height;
  final double width;
  final String text;
  final double textSize;
  final IconData? icon;
  final double radius;

  ButtonViewProfileProperties({
    required this.height,
    required this.width,
    required this.text,
    required this.textSize,
    required this.radius,
    this.icon,
  });
}

class ReusableViewProfileButton extends StatefulWidget {
  final ButtonViewProfileProperties properties;
  final VoidCallback onPressed;

  ReusableViewProfileButton({required this.properties, required this.onPressed});

  @override
  _ReusableViewProfileButtonState createState() => _ReusableViewProfileButtonState();
}

class _ReusableViewProfileButtonState extends State<ReusableViewProfileButton> with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  Future<void> _onTapDown(TapDownDetails details) async {
    setState(() {
      _isPressed = true;
    });
    HapticFeedback.heavyImpact();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.properties.height,
      width: widget.properties.width,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: () {
          setState(() {
            _isPressed = true;
          });
          // Perform your onPressed logic here
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _isPressed = false;
            });
            widget.onPressed();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.center,
          transform: Matrix4.translationValues(0.0, _isPressed ? 2.0 : 0.0, 0.0),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(widget.properties.radius),
            border: Border.all(color: AppColors.primaryShadow, width: 2),
            boxShadow: _isPressed
                ? []
                : [
                    const BoxShadow(
                      color: AppColors.primaryShadow,
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.properties.icon != null)
                  Icon(
                    widget.properties.icon,
                    size: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                if (widget.properties.icon != null) const SizedBox(width: 5),
                Text(
                  widget.properties.text,
                  style: GoogleFonts.nunito(
                    fontSize: widget.properties.textSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
