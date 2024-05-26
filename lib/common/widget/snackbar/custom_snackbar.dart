import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReusableSnackbar extends ConsumerStatefulWidget {
  final String message;
  final Color backgroundColor;
  final Animation<double>? animation; // Optional custom animation

  const ReusableSnackbar({
    Key? key,
    required this.message,
    required this.backgroundColor,
    this.animation,
  }) : super(key: key);

  @override
  ConsumerState<ReusableSnackbar> createState() => _ReusableSnackbarState();
}

class _ReusableSnackbarState extends ConsumerState<ReusableSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.animation != null) {
      _opacityAnimation = widget.animation!;
    }

    _controller.forward();
    Future.delayed(const Duration(seconds: 3), _controller.reverse);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SnackBar(
        backgroundColor: widget.backgroundColor,
        content: Text(widget.message),
      ),
    );
  }
}
