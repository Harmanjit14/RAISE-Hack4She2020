import 'package:RAISE/colorFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqplayer/iqplayer.dart';

class AwarePage extends StatefulWidget {
  @override
  _AwarePageState createState() => _AwarePageState();
}

class _AwarePageState extends State<AwarePage> with ColorFile {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              "Self-Defence Videos",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.black), fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
            width: double.maxFinite,
            height: 300,
            child: ListView(
              shrinkWrap: true,
              children: [
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "Weight Loss for Women",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://www.youtube.com/watch?v=xViWU57xDk4',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stance and Palm Strike",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    )),
                Divider(),
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "Stance and Palm Strike",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://www.youtube.com/watch?v=AXZlb-3MMYE',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Front in-Step Kick",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    )),
                Divider(),
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "Full Body Workout",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://www.youtube.com/watch?v=ml6cT4AZdqI&feature=youtu.be',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Font choke defence",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    )),
                Divider(),
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "20 min Workouty",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://www.youtube.com/watch?v=AzV3EA-1-yM&feature=youtu.be',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Side Clinch",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    )),
                Divider(),
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "Gun defence",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'hhttps://www.youtube.com/watch?v=hIXMt5CGlIM&feature=youtu.be',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Disarm a gun man",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.purple,
                          size: 30,
                        )
                      ],
                    )),
                Divider(),
                OutlineButton(
                    padding: EdgeInsets.all(15),
                    borderSide: BorderSide(color: Colors.purple),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IQScreen(
                            title: "Weight Loss for Women",
                            description: 'Fitness Videos',
                            videoPlayerController:
                                VideoPlayerController.network(
                              'https://www.youtube.com/watch?v=xViWU57xDk4',
                            ),
                            iqTheme: IQTheme(
                              loadingProgress: SpinKitCircle(
                                color: Colors.white,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Temp defence",
                          style: TextStyle(fontSize: 20, color: Colors.purple),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.play_arrow,
                          color: white,
                          size: 30,
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            // padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "Articles",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.black),
                        fontSize: 35),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
