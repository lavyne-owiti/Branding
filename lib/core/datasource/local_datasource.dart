import 'dart:async';

abstract class LocalDataSource {
  Future<void> clear();
}