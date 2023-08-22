class CacheException implements Exception {}

class InvalidArgumentException implements Exception {}

class NetworkException implements Exception {}

class NotFoundException implements Exception {}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}