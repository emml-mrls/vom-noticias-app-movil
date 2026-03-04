abstract class Failure {
  final String message;
  const Failure(this.message);

}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Sin Conexion de internet']) : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Error en el servidor']) : super(message);
}

class ParseFailure extends Failure {
  const ParseFailure([String message = 'Error de los datos']) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Uups! Ocurrió un error inesperado']) : super(message);
}