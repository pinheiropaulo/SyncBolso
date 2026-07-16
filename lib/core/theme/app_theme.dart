import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Paleta de Cores Estrita
  static const Color primaryColor = Color(0xFF00C48C); // Verde positivo
  static const Color dangerColor = Color(0xFFFF5252);  // Vermelho negativo
  static const Color backgroundColor = Color(0xFFF4F6F8); // Fundo do app
  static const Color surfaceColor = Colors.white;      // Cor dos cartões

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        error: dangerColor,
        surface: surfaceColor,
      ),
      // Injeção da Fonte Roboto globalmente
      textTheme: GoogleFonts.robotoTextTheme(),
      
      // Padronização do Cabeçalho (AppBar) para todas as telas
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black54),
        titleTextStyle: GoogleFonts.roboto(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // Padronização do Botão Flutuante (FAB)
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      
      // Padronização dos Cartões para evitar repetição de código
      cardTheme: CardTheme(
        color: surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}