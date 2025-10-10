import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detail_page.dart';
import 'bookmark_manager.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Bookmark",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: bookmarkedComics.isEmpty
          ? const Center(
              child: Text(
                "Tidak ada komik yang dibookmark",
                style: TextStyle(fontSize: 15),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkedComics.length,
              itemBuilder: (context, index) {
                final comic = bookmarkedComics[index];
                return Card(
                  margin: 
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        comic["image"],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(comic["title"]),
                    subtitle: Text(comic["chapter"]),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailPage(comic: comic)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}