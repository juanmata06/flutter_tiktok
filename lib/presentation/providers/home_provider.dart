import 'package:flutter/material.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/infrastructure/models/local_video_model.dart';
import 'package:flutter_tiktok/shared/data/local_video_posts.dart';

class HomeProvider extends ChangeNotifier {
  //TODO: repository, datasource

  bool isFirstLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    
    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    isFirstLoading = false;
    notifyListeners();
  }
}
