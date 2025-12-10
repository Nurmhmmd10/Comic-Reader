import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String? message;
  const LoadingIndicator({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) const SizedBox(height: 8),
          if (message != null) Text(message!),
        ],
      ),
    );
  }
}