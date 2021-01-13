import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          // backgroundColor: Colors.transparent,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search for songs, albums, podcasts and more...',
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search_rounded,
                // size: 26.0,
                color: theme.colorScheme.onPrimary,
              ),
              /* suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: theme.colorScheme.onPrimary,
                ),
                iconSize: 24.0,
                onPressed: () => null,
              ), */
              hintStyle: theme.primaryTextTheme.bodyText1.copyWith(
                color: theme.colorScheme.onPrimary.withOpacity(0.5),
              ),
            ),
            cursorColor: theme.colorScheme.onPrimary,
            style: theme.primaryTextTheme.bodyText1,
            minLines: 1,
          ),
        ),
      ],
    );
  }
}
