import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/views/dashboard_view.dart'; // Ajuste o caminho se necessário

void main() {
  // ProviderScope é o wrapper obrigatório para ativar o Riverpod
  runApp(const ProviderScope(child: SyncBolsoApp()));
}

class SyncBolsoApp extends StatelessWidget {
  const SyncBolsoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SyncBolso',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Injeção do tema criado
      home: const DashboardView(), 
    );
  }
}
