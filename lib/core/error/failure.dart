import 'package:flutter/material.dart';

abstract class Failure {
  final String message;
  final IconData icon;
  const Failure(this.message, this.icon);

}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = "Sin Conexion de internet", super.icon = Icons.wifi_off]);
}

class ServerFailure extends Failure {  
  const ServerFailure([super.message = 'Error en el servidor', super.icon = Icons.cloud_off]);
}

class ParseFailure extends Failure {
  const ParseFailure([super.message = 'Error al mostrar los datos', super.icon = Icons.sync_problem]);
}

class UnknownFailure extends Failure {  
  const UnknownFailure([super.message = 'Uups! Ocurrió un error inesperado', super.icon = Icons.error]);
}