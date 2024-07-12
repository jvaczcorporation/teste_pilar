import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:teste_pilar/app/commons/commons.dart';

abstract class ConnectionService {
  Future<void> get checkConnection;
}

class ConnectionServiceImpl implements ConnectionService {
  final Connectivity connectivity;

  ConnectionServiceImpl({
    required this.connectivity,
  });

  @override
  Future<void> get checkConnection async {
    try {
      final result = await connectivity.checkConnectivity();

      final hasConnection = result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile;

      if (!hasConnection) {
        throw FailureConnection(
          message: "Por favor, verifique sua conexão com a internet.",
        );
      }
    } catch (exception) {
      if (exception is FailureConnection) {
        rethrow;
      }

      throw FailureConnection(
        message: "Não foi possível verificar a conexão com a internet.",
      );
    }
  }
}
