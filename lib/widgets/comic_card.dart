import 'package:flutter/material.dart';
import '../models/comic.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;
  final VoidCallback? onTap;
  const ComicCard({required this.comic, this.onTap});

  Widget _image() {
    final img = comic.image;
    if (img.startsWith('http')) {
      return Image.network(img, height: 140, width: 120, fit: BoxFit.cover);
    } else {
      return Image.asset('assets/images/$img', height: 140, width: 120, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            ClipRRect(borderRadius: BorderRadiusGeometry.circular(8), child: _image()),
            const SizedBox(height: 8),
            Text(comic.title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, size: 14, color: Colors.amber),
                Text('${comic.rating.toString()}')
              ],
            )
          ],
        ),
      ),
    );
  }
}