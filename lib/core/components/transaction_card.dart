import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; // Importando a paleta de cores

class TransactionCard extends StatelessWidget {
  final String title;
  final String date;
  final double amount;
  final bool isExpense;

  const TransactionCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  });

  @override
  Widget build(BuildContext context) {
    // Como definimos o formato do Card no AppTheme, não precisamos
    // passar elevation ou shape aqui. O Flutter aplica automaticamente.
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: AppTheme.backgroundColor,
          child: Icon(
            isExpense ? Icons.arrow_downward : Icons.arrow_upward,
            color: isExpense ? AppTheme.dangerColor : AppTheme.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(date),
        trailing: Text(
          '${isExpense ? '-' : ''} R\$ ${amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: isExpense ? AppTheme.dangerColor : AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}