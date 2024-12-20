abstract interface class ISecureStorage {
  Future<String?> readSecureData(String key);
  Future<void> writeSecureData(String key, String value);
  Future<void> deleteSecureData(String key);
}
