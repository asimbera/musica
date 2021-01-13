import 'package:animations/animations.dart';
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musica/views/home/cubit/tab_cubit.dart';
import 'package:musica/views/home/explore/explore.dart';
import 'package:musica/views/home/library/library.dart';
import 'package:musica/views/home/search/search.dart';
import 'package:musica/views/player/player.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AudioServiceWidget(
      child: BlocProvider(
        create: (context) => TabCubit(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            body: Builder(
              builder: (context) {
                final tabCubit = context.watch<TabCubit>();
                switch (tabCubit.state) {
                  case 0:
                    return ExplorePage();
                  case 1:
                    return SearchPage();
                  case 2:
                    return LibraryPage();
                  default:
                    return Container();
                }
              },
            ),
            bottomNavigationBar: _BottomNavigation(),
          ),
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabCubit = context.watch<TabCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _MusicControlls(),
        BottomNavigationBar(
            currentIndex: tabCubit.state,
            onTap: (val) => tabCubit.changeTab(val),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_library_music),
                label: 'Library',
              ),
            ]),
      ],
    );
  }
}

class _MusicControlls extends StatelessWidget {
  const _MusicControlls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (_, __) => Container(
        color: Colors.blueGrey.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image:
                      NetworkImage('https://picsum.photos/seed/asim/400/400'),
                  height: 55,
                  width: 55,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '__song_title__',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '__artist_or_album__',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      color: Theme.of(context).colorScheme.onPrimary,
                      // iconSize: 42,
                      icon: Icon(Icons.play_arrow),
                      onPressed: () => null,
                    ),
                  ),
                  IconButton(
                    // color: Theme.of(context).colorScheme.onPrimary,
                    // iconSize: 42,
                    icon: Icon(Icons.skip_next),
                    onPressed: () => null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      openBuilder: (_, __) => Player(),
    );
  }
}
