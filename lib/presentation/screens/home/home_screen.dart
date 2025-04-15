import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/providers_exports.dart';
import '../../widgets/widgets_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      body: provider.isFirstLoading
        ? const Center(child: CircularProgressIndicator())
        : VideoScrollableView(videos: provider.videos)
    );
  }
}
