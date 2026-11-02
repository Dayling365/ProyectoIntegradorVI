import 'package:sistema_libreria_app/data/models/logs_model.dart';
import 'package:sistema_libreria_app/data/repositories/logs_repository.dart';

class LogsService {
  final LogsRepository _logsRepository;

  LogsService(this._logsRepository);

  Future<List<LogModel>> getAllLogs() async {
    return await _logsRepository.getAll();
  }

  Future<List<LogModel>> getLogsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await _logsRepository.getLogsByDateRange(startDate, endDate);
  }
}