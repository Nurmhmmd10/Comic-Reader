import 'package:flutter/material.dart';
import '../models/comic.dart';
import '../services/bookmark_service.dart';
import '../utils/session_manager.dart';
import 'reader_page.dart';

class DetailPage extends StatefulWidget {
  final Comic comic;
  const DetailPage({required this.comic});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isBookmarked = false;
  bool _loading = false;

  void _toggleBookmark() async {
    final uid = SessionManager.userId;
    if (uid == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please login first')));
      return;
    }
    setState(() => _loading = true);
    final res = await BookmarkService.add(uid, widget.comic.id);
    setState(() => _loading = false);
    if (res['status'] == 'success') {
      setState(() => _isBookmarked = true);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bookmark successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? 'Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.comic;
    return Scaffold(
      appBar: AppBar(title: Text(c.title)),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          Center(child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(8), child: c.image.startsWith('http') ? Image.network(c.image, height: 260) : Image.asset('assets/images/${c.image}', height: 260))),
          Padding(padding: const EdgeInsets.all(12), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(c.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(c.genre, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Row(children: [const Icon(Icons.star, color: Colors.amber), Text('${c.rating}')]),
              const SizedBox(height: 12),
              Text('Sinopsis', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(c.synopsis),
              const SizedBox(height: 12),
              Text('Daftar Chapter (${c.totalChapters})' , style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          )),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: c.totalChapters,
            itemBuilder: (ctx, idx) {
              final chap = c.totalChapters - idx;
              return ListTile(
                title: Text('Chapter $chap'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReaderPage(comic: c, initialChapter: chap))),
              );
            }
          ),
          const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: _loading ? const CircularProgressIndicator(color: Colors.white) : Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
        onPressed: _toggleBookmark,
      ),
    );
  }
}