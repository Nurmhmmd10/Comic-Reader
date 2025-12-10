import 'package:flutter/material.dart';
import '../services/comic_service.dart';
import '../models/comic.dart';
import '../widgets/comic_tile.dart';

class SearchPage extends StatefulWidget {
  @override State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _ctl = TextEditingController();
  List<Comic> _results = [];
  bool _loading = false;

  void _search(String q) async {
    if (q.trim().isEmpty) { setState(()=>_results=[]); return; }
    setState(()=>_loading=true);
    final res = await ComicService.search(q);
    setState(()=>_results=res);
    setState(()=>_loading=false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(controller: _ctl, onChanged: _search, decoration: const InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search by title or genre')),
          ),
          if (_loading) const LinearProgressIndicator(),
          Expanded(
            child: ListView(
              children: _results.map((c) => ComicTile(comic: c, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> cPage(c))))).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget cPage(Comic c) => Scaffold(
    appBar: AppBar(title: Text(c.title)),
    body: Center(child: Text('Detail placeholder'))
  );
}
