import 'package:RAISE/colorFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
import 'package:iqplayer/iqplayer.dart';

class FitnessScreen extends StatefulWidget {
  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> with ColorFile {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deepBrown,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Fitness",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.white,
          )),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: deepBrown,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            RaisedButton(
          child: Text('Open IQPlayer'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => IQScreen(
                  title: "hello",
                  description: 'Simple video as a demo video',
                  videoPlayerController: VideoPlayerController.network(
                    'https://d11b76aq44vj33.cloudfront.net/media/720/video/5def7824adbbc.mp4',
                  ),
                  subtitleProvider: SubtitleProvider.fromNetwork(
                      'https://duoidi6ujfbv.cloudfront.net/media/0/subtitles/5675420c9d9a3.vtt'),
                  iqTheme: IQTheme(
                    loadingProgress: SpinKitCircle(
                      color: Colors.red,
                    ),
                    playButtonColor: Colors.transparent,
                    videoPlayedColor: Colors.indigo,
                    // playButton: (true) {
                    //   if (isPlay)
                    //     return Icon(
                    //       Icons.pause_circle_filled,
                    //       color: Colors.red,
                    //       size: 50,
                    //     );
                    //   return Icon(
                    //     Icons.play_circle_outline,
                    //     color: Colors.red,
                    //     size: 50,
                    //   );
                    // },
                  ),
                ),
              ),
            );
          },
        ),
          ]),
        ),
      ),
    );
  }
}
