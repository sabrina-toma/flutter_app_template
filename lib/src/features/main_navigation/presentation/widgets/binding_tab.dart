import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BindingTab<T> extends StatelessWidget {
  final Bindings binding;
  final Widget child;

  const BindingTab({
    super.key,
    required this.binding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    binding.dependencies();
    return child;
  }
}