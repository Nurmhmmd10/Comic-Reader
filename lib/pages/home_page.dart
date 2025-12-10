import 'package:flutter/material.dart';
import '../services/comic_service.dart';
import '../models/comic.dart';
import '../widgets/comic_card.dart';
import '../widgets/comic_tile.dart';
import 'detail_page.dart';
import 'bookmark_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onToggleTheme;
  final bool isDark;
  const HomePage({required this.onToggleTheme, required this.isDark});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comic> _comics = [];
  bool _loading = true;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetch();
  }
  
  void _fetch() async {
    setState(() => _loading = true);
    final list = await ComicService.fetchAll();
    setState(() => _comics = list);
    setState(() => _loading = false);
  }

  void _onNavTap(int idx) {
    setState(() => _selectedIndex = idx);
  }

  @override
  Widget build(BuildContext context) {
    final body = _selectedIndex == 0 ? _buildHome() : const Center(child: Text('Daftar Komik (placeholder)'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comic Reader', textAlign: TextAlign.center),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchPage())), icon: const Icon(Icons.search)),
          IconButton(onPressed: (){
            final v = !widget.isDark;
            widget.onToggleTheme(v);
          }, icon: Icon(widget.isDark?Icons.dark_mode:Icons.light_mode))
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Datfar'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: _selectedIndex == 2 ? FloatingActionButton(
        child: const Icon(Icons.bookmark),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookmarkPage())),
      ) : null,
    );
  }

  Widget _buildHome() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    return RefreshIndicator(
      onRefresh: () async => _fetch(),
      child: ListView(
        children: [
          const Padding(padding: EdgeInsets.all(12), child: Text('🔥 Populer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _comics.length,
              itemBuilder: (c, i) {
                final comic = _comics[i];
                return ComicCard(comic: comic, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(comic: comic))));
              },
            ),
          ),
          const Padding(padding: EdgeInsets.all(12), child: Text('🆕 Update Terbaru', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ..._comics.map((c) => ComicTile(comic: c, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(comic: c))))).toList()
        ],
      ),
    );
  }
}