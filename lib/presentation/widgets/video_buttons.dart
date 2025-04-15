import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';

import '../../shared/helpers/helpers_exports.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  
  const VideoButtons({
    super.key, 
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(
          value: video.likes,
          icon: Icons.favorite, 
          color: Colors.red
        ),
        const SizedBox(height: 10),
        _CustomIconButton(
          value: video.views,
          icon: Icons.remove_red_eye_outlined, 
        ),
        const SizedBox(height: 10),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: _CustomIconButton(
            icon: Icons.play_circle_outline, 
          ),
        )
      ],
    );
  }
}


class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final int? value;
  final Color iconColor;

  const _CustomIconButton({
    required this.icon, 
    this.value, 
    color
  }):iconColor = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {}, 
          icon: Icon(icon, size: 30, color: iconColor), 
        ),
        if (value != null)
          Text('${ HumanFormats.number(value!.toDouble()) }')
      ],
    );
  }
}