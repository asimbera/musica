import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('My Library'),
        ),
      ],
    );
  }
}
