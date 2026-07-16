import 'package:drift/drift.dart';

// Importação condicional criada no passo anterior
import 'connection/connection.dart'; 
import 'tables/transacoes.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Transacoes])
class AppDatabase extends _$AppDatabase {
  
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;
}