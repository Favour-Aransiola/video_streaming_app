// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetWorkInfoChecker {
  InternetConnectionChecker connectivityChecker;
  NetWorkInfoChecker({
    required this.connectivityChecker,
  });

  Future<bool> get isConnected => connectivityChecker.hasConnection;
}
