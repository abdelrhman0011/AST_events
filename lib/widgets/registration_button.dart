import 'package:flutter/material.dart';

class RegistrationButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Gradient gradient;
  final void Function() onTap;

  const RegistrationButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.gradient,
    required this.onTap,
  }) : super(key: key);

  @override
  _RegistrationButtonState createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
  double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    // تم حذف Expanded من هنا.
    // الـ Widget الجذر هو GestureDetector مباشرة.
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _elevation = -10),
        onExit: (_) => setState(() => _elevation = 0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _elevation, 0),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: widget.gradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, _elevation.abs()),
              ),
            ],
          ),
          // لا حاجة لـ LayoutBuilder أو ConstrainedBox هنا،
          // لأن الحجم يتم التحكم فيه من الخارج.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                widget.description,
                style: const TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
