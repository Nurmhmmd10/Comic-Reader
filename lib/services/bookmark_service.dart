import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comic.dart';
import '../utils/api_config.dart';

class BookmarkService {
  static Future<Map<String,dynamic>> add(int userId, int comicId) async {
    final url = Uri.parse('${ApiConfig.baseUrl}bookmarks/add_bookmark.php');
    final res = await http.post(url, body: {'user_id': userId.toString(), 'comic_id': comicId.toString()});
    return json.decode(res.body);
  }

  static Future<Map<String,dynamic>> remove(int userId, int comicId) async {
    final url = Uri.parse('${ApiConfig.baseUrl}bookmarks/remove_bookmark.php');
    final res = await http.post(url, body: {'user_id': userId.toString(), 'comic_id': comicId.toString()});
    return json.decode(res.body);
  }

  static Future<List<Comic>> list(int userId) async {
    final url = Uri.parse('${ApiConfig.baseUrl}bookmarks/get_bookmarks.php?user_id=$userId');
    final res = await http.get(url);
    final maps = json.decode(res.body);
    if (maps is Map && maps['status'] == 'success') {
      return List<Comic>.from((maps['data'] as List).map((e) => Comic.fromJson(e)));
    } else if (maps is List) {
      return List<Comic>.from(maps.map((e) => Comic.fromJson(e)));
    }
    return [];
  }
}
