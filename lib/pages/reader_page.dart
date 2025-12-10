import 'package:flutter/material.dart';
import '../models/comic.dart';

class ReaderPage extends StatefulWidget {
  final Comic comic;
  final int initialChapter;
  const ReaderPage({required this.comic, required this.initialChapter});

  @override
  State<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  late int _current;
  @override
  void initState() {
    super.initState();
    _current = widget.initialChapter;
  }

  void _next() {
    if (_current > 1) setState(() => _current--);
  }
  void _prev() {
    if (_current < widget.comic.totalChapters) setState(() => _current++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.comic.title} - Chapter $_current'),
        actions: [
          IconButton(onPressed: _prev, icon: const Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: _next, icon: const Icon(Icons.arrow_forward_ios)),
        ],
      ),
      body: Center(
        child: Text('Reader mockup\nComic: ${widget.comic.title}\nChapter: $_current', textAlign: TextAlign.center),
      ),
    );
  }
}