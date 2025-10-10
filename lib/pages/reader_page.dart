import 'package:flutter/material.dart';

class ReaderPage extends StatefulWidget {
  final Map<String, dynamic> comic;
  final int currentChapter;

  const ReaderPage({super.key, required this.currentChapter, required this.comic});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  late int chapterNow;

  @override
  void initState() {
    super.initState();
    chapterNow = widget.currentChapter;
  }

  void nextChapter() {
    if (chapterNow < widget.comic["totalChapters"]) {
      setState(() => chapterNow++);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ini chapter terakhir!")),
      );
    }
  }

  void prevChapter() {
    if (chapterNow > 1) {
      setState(() => chapterNow--);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ini chapter pertama!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final comic = widget.comic;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "${comic["title"]} - Chapter $chapterNow",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Isi komik untuk Chapter $chapterNow akan tampil di sini.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.blue[50],
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: prevChapter,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Sebelumnya"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: nextChapter,
                  icon: const Icon(Icons.arrow_forward), 
                  label: const Text("Berikutnya"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
