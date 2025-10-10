import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'reader_page.dart';
import 'bookmark_manager.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> comic;

  const DetailPage({super.key, required this.comic});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    final comic = widget.comic;
    final totalChapters = comic["totalChapters"] ?? 10;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          comic["title"],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
                if (isBookmarked) {
                  if (!bookmarkedComics.contains(widget.comic)) {
                    bookmarkedComics.add(widget.comic);
                  }
                } else {
                  bookmarkedComics.remove(widget.comic);
                }
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isBookmarked
                      ? "Ditambahkan ke Bookmark!"
                      : "Dihapus dari Bookmark!"),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      comic["image"],
                      height: 280,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    comic["title"],
                    style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    comic["genre"],
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      Text(" ${comic["rating"]}"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Sinopsis", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 20, 
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      comic["synopsis"],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 5),
              child: Text(
                "Daftar Chapter (${totalChapters})",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.blue),
              ),
            ),
            ListView.builder(
              itemCount: totalChapters,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final chapterNumber = totalChapters - index;
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: ListTile(
                    title: Text("Chapter $chapterNumber"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReaderPage(
                            comic: comic, 
                            currentChapter: chapterNumber,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
