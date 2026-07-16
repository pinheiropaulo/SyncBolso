import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

QueryExecutor openConnection() {
  return DatabaseConnection.delayed(Future(() async {
    final result = await WasmDatabase.open(
      databaseName: 'syncbolso_db',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );
    
    if (result.missingFeatures.isNotEmpty) {
      print('Aviso: Faltam recursos no navegador: ${result.missingFeatures}');
    }
    
    return result.resolvedExecutor;
  }));
}