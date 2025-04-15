import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String title;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.title
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: controller.initialize(), 
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done){
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2)
          );
        }
        return GestureDetector(
          onTap: () {
            if(controller.value.isPlaying){
              controller.pause();
              return;
            }
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                _CustomGradiend(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.2],
                  colors: [
                    Colors.black54,
                    Colors.transparent
                  ]
                ),
                _CustomGradiend(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.2],
                  colors: [
                    Colors.black26,
                    Colors.transparent
                  ]
                ),
                Positioned(
                  bottom: 50,
                  left: 50,
                  child: _VideoCaption(title: widget.title)
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


class _VideoCaption extends StatelessWidget {
  final String title;
  
  const _VideoCaption({
    super.key, 
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(title, maxLines: 2, style: textStyle),
    );
  }
}

class _CustomGradiend extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradiend({
    this.begin = Alignment.centerLeft, 
    this.end = Alignment.centerRight, 
    required this.stops, 
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors
          )
        ),
      ),
    );
  }
}