
import 'package:better_player_hls/better_player_hls.dart';
import 'package:flutter/material.dart';

class HlsSubtitlesPage extends StatefulWidget {
  const HlsSubtitlesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HlsSubtitlesPageState createState() => _HlsSubtitlesPageState();
}

class _HlsSubtitlesPageState extends State<HlsSubtitlesPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerControlsConfiguration controlsConfiguration =
        const BetterPlayerControlsConfiguration(
      controlBarColor: Colors.black26,
      iconsColor: Colors.white,
      playIcon: Icons.play_arrow_outlined,
      progressBarPlayedColor: Colors.indigo,
      progressBarHandleColor: Colors.indigo,
      skipBackIcon: Icons.replay_10_outlined,
      skipForwardIcon: Icons.forward_10_outlined,
      backwardSkipTimeInMilliseconds: 10000,
      forwardSkipTimeInMilliseconds: 10000,
      enableSkips: true,
      enableFullscreen: true,
      enablePip: true,
      enablePlayPause: true,
      enableMute: true,
      enableAudioTracks: true,
      enableProgressText: true,
      enableSubtitles: true,
      showControlsOnInitialize: true,
      enablePlaybackSpeed: true,
      controlBarHeight: 40,
      loadingColor: Colors.red,
      overflowModalColor: Colors.black54,
      overflowModalTextColor: Colors.white,
      overflowMenuIconsColor: Colors.white,
    );

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            controlsConfiguration: controlsConfiguration,
            aspectRatio: 16 / 9,
            fit: BoxFit.contain,
            subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
              fontSize: 16.0,
            ));
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, "https://1ckwsmcn-3000.inc1.devtunnels.ms/1704691696988/video/output.m3u8",
        useAsmsSubtitles: true);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HLS subtitles"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
          
            AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: _betterPlayerController),
            ),
          ],
        ),
      ),
    );
  }
}
