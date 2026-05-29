import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String mssg;
  final VoidCallback onRetry;
  final IconData icon;
  const ErrorView({super.key, required this.mssg, required this.onRetry, required this.icon});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60),
          const SizedBox(height: 8),
          Text(mssg, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => onRetry,
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}