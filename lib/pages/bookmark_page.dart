import 'package:flutter/material.dart';
import '../services/bookmark_service.dart';
import '../utils/session_manager.dart';
import '../models/comic.dart';
import '../widgets/comic_tile.dart';

class BookmarkPage extends StatefulWidget {
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  List<Comic> _list = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    final uid = SessionManager.userId;
    if (uid == null) {
      setState(() => _loading =false);
      return;
    }
    final res = await BookmarkService.list(uid);
    setState(() => _list = res);
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: _loading ? const Center(child: CircularProgressIndicator()) : _list.isEmpty ? const Center(child: Text('No bookmark')) :
      ListView(children: _list.map((c) => ComicTile(comic: c, onTap: () => {})).toList()),
    );
  }
}