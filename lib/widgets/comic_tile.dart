import 'package:flutter/material.dart';
import '../models/comic.dart';

class ComicTile extends StatelessWidget {
  final Comic comic;
  final VoidCallback? onTap;
  const ComicTile({required this.comic, this.onTap});

  @override
  Widget build(BuildContext context) {
    final img = comic.image;
    Widget imageWidget = img.startsWith('http')
        ? Image.network(img, width: 60, height: 60, fit: BoxFit.cover)
        : Image.asset('assets/images/$img', width: 60, height: 60, fit: BoxFit.cover);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: ClipRRect(borderRadius: BorderRadius.circular(8), child: imageWidget),
        title: Text(comic.title),
        subtitle: Text('ch. ${comic.totalChapters}'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}