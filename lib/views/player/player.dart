import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.more_horiz),
            itemBuilder: (_) => <PopupMenuEntry<int>>[
              PopupMenuItem(child: Text('Something'), value: 0),
            ],
          ),
        ],
        // Styling
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        textTheme: Theme.of(context).textTheme,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _AppBar(),
          _CoverImage(),
          _TrackDetails(),
          _DurationSlider(),
          _StateControlls(),
          _LogicControlls(),
        ],
      ),
    );
  }
}

class _LogicControlls extends StatelessWidget {
  const _LogicControlls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.repeat),
            onPressed: () => null,
          ),
          IconButton(
            icon: Icon(Icons.queue_music),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}

class _StateControlls extends StatelessWidget {
  const _StateControlls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.skip_previous),
            onPressed: () => null,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              color: Theme.of(context).colorScheme.onPrimary,
              iconSize: 42,
              icon: Icon(Icons.play_arrow),
              onPressed: () => null,
            ),
          ),
          IconButton(
            iconSize: 35,
            icon: Icon(Icons.skip_next),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}

class _DurationSlider extends StatelessWidget {
  const _DurationSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Slider.adaptive(
            value: 0.3,
            onChanged: (_) => null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("02:56"),
                Text("06:35"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackDetails extends StatelessWidget {
  const _TrackDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "__song_title__",
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            "__artist_or_album__",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      // height: 400,
      // width: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: NetworkImage('https://picsum.photos/seed/asim/400/400'),
          height: 350,
          width: 350,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
