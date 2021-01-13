import 'package:flutter/material.dart';
import 'package:musica/views/home/home.dart';
import 'package:musica/views/player/player.dart';

void main() {
  runApp(Musica());
}

const String APP_TITLE = 'Musica';
final ThemeData themeData = ThemeData(
  primarySwatch: Colors.deepPurple,
  fontFamily: 'Nunito',
);

class Musica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Nunito',
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (_) => Home(title: APP_TITLE),
        '/player': (_) => Player(),
        // '/song-info': (_) => SongInfo(),
        // '/album-info': (_) => AlbumInfo(),
        // '/playlist-info': (_) => PlaylistInfo(),
        // '/search': (_) => Search(),
      },
    );
  }
}
