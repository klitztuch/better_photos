import 'package:logging/logging.dart';
import 'package:nextcloud/nextcloud.dart';

class NextcloudService {
  Logger _logger = Logger((NextcloudService).toString());
  final String host;
  final String appPassword;

  NextcloudService(this.host, this.appPassword);

  Future<List<String>> getImages() async {
    try {
      final client = NextCloudClient.withAppPassword(
          Uri(host: this.host), this.appPassword);

      return await _getFiles(client, '/Photos/').then((value) => value
          .where((element) => element.mimeType!.contains(RegExp('image/.*')))
          .map((e) => e.path)
          .toList());
    } catch (e, stacktrace) {
      _logger.shout('Error getting images from nextcloud.', e, stacktrace);
      return Future.error(e);
    }
  }

  List<WebDavFile> _getDirectories(List<WebDavFile> files) {
    return files.where((element) => element.isDirectory).toList();
  }

  Future<List<WebDavFile>> _getFiles(
      NextCloudClient client, String path) async {
    var files = await client.webDav.ls(path);
    var directories = _getDirectories(files);

    while (directories.isNotEmpty) {
      var newFiles = <WebDavFile>[];
      for (var i = 0; i < directories.length; i++) {
        var directory = directories[i];
        var currentFiles = await client.webDav.ls(directory.path);
        if (currentFiles.isNotEmpty) {
          newFiles.addAll(currentFiles.toList());
        }
      }
      directories = newFiles.where((element) => element.isDirectory).toList();
      files.addAll(newFiles);
    }
    return files;
  }
}
