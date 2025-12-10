import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comic.dart';
import '../utils/api_config.dart';

class ComicService {
  static Future<List<Comic>> fetchAll() async {
    final url = Uri.parse('${ApiConfig.baseUrl}comics/get_comics.php');
    final res = await http.get(url);
    final maps = json.decode(res.body);
    if (maps is Map && maps['status'] == 'success' && maps['data'] != null) {
      return List<Comic>.from((maps['data'] as List).map((e) => Comic.fromJson(e)));
    } else if (maps is List) {
      return List<Comic>.from(maps.map((e) => Comic.fromJson(e)));
    }
    return [];
  }

  static Future<List<Comic>> search(String q) async {
    final url = Uri.parse('${ApiConfig.baseUrl}comics/search_comics.php?q=${Uri.encodeQueryComponent(q)}');
    final res = await http.get(url);
    final maps = json.decode(res.body);
    if (maps is Map && maps['status'] == 'success') {
      return List<Comic>.from((maps['data'] as List).map((e) => Comic.fromJson(e)));
    } else if (maps is List) {
      return List<Comic>.from(maps.map((e) => Comic.fromJson(e)));
    }
    return [];
  }

  static Future<Comic?> detail(int id) async {
    final url = Uri.parse('${ApiConfig.baseUrl}comics/get_comic_detail.php?id=$id');
    final res = await http.get(url);
    final maps = json.decode(res.body);
    if (maps['status'] == 'success') {
      return Comic.fromJson(maps['data']);
    }
    return null;
  }
}