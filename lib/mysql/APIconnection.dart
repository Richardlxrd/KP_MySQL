import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost',
      user = 'flutter',
      password = '0451',
      db = '282_strahov';

  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);

    return await MySqlConnection.connect(settings);
  }
}
