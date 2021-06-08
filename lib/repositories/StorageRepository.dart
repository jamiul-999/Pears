import 'dart:io';

import 'package:pears/providers/StorageProvider.dart';

class StorageRepository {
  StorageProvider storageProvider = StorageProvider();
  Future<String> uploadImage(File file, String path) =>
      storageProvider.uploadImage(file, path);
}
