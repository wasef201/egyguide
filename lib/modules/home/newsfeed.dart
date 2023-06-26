import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:better_player/better_player.dart';

class TopReviewer {
final String image;
final String name;
final level ul;

  TopReviewer(this.image, this.name, this.ul);


}

enum level {
  diamond,
  gold,
  silver,
  bronze,
}
Color ulc(level ul) {
Color color;
switch (ul){
  case level.diamond:
    color = Color(0xffe978fc);
    break;
  case level.gold:
    color = Color(0xffe7b238);
    break;
  case level.silver:
    color = Color(0xffa9b1bd);
    break;
  case level.bronze:
    color = Color(0xffa95b2b);
    break;
}
return color;

}



class News extends StatelessWidget {
  List<TopReviewer> top = [
    TopReviewer('assets/imges/p1.webp', 'احمد علي', level.diamond),
    TopReviewer('assets/imges/p2.webp', 'عمرو محمد', level.bronze),
    TopReviewer('assets/imges/p3.webp', 'حسناء يوسف', level.gold),
    TopReviewer('assets/imges/p4.webp', 'الاء علي', level.silver),

  ];
    @override
  Widget build(BuildContext context) {

    return SafeArea(
        bottom:false,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/imges/EgyGuide.png'),
                        width: 120,
                      ),
                      Text('اهلا يا احمد',
                          style: TextStyle(color: mc, fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                            backgroundColor: Color(0x4dffffff),
                            child: Icon(Icons.search_rounded)),
                        color: mc,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: Color(0x4dffffff),
                          child:
                              Image(image: AssetImage('assets/imges/cert.png')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'الاكثر تقييما',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: ListView.separated(
                  itemBuilder: (context, index) => TopRevItem(model: top[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: top.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'الاكثر رواجاً',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(10),
                    )),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/imges/p2.webp'),
                              backgroundColor: mc,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('حسناء محمد',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                Text('منذ 2 ساعة')
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Text('متابعة'),
                              highlightColor: mc,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('افضل مطعم داخل كفرالشيخ'),
                          InkWell(
                              onTap: () {
                              },
                              child: Text('كفرالشيخ', style: TextStyle(color: mc, fontWeight: FontWeight.bold,), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),

                    Padding(

                      padding: const EdgeInsets.only(right: 8,left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,

                          child: BetterPlayer.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            betterPlayerConfiguration: BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                controlsConfiguration: BetterPlayerControlsConfiguration(
                                  enableProgressBar: true,
                                  enableSkips: false,
                                  enableOverflowMenu: false,
                                  enableProgressText: false,
                                  enableSubtitles: false,
                                  enablePip: false,
                                  backgroundColor: Color(0xFFFFFFFF),
                                  controlsHideTime: Duration(milliseconds: 30),
                                  controlBarColor: Color(0xf000000),
                                  enableQualities: false,
                                  playerTheme: BetterPlayerTheme.cupertino,
                                  controlBarHeight: 40,


                                )
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(10),
                    )),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/imges/p2.webp'),
                              backgroundColor: mc,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('حسناء محمد',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                Text('منذ 2 ساعة')
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Text('متابعة'),
                              highlightColor: mc,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('افضل مطعم داخل كفرالشيخ'),
                          InkWell(
                              onTap: () {
                              },
                              child: Text('كفرالشيخ', style: TextStyle(color: mc, fontWeight: FontWeight.bold,), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),

                    Padding(

                      padding: const EdgeInsets.only(right: 8,left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,

                          child: BetterPlayer.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            betterPlayerConfiguration: BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                controlsConfiguration: BetterPlayerControlsConfiguration(
                                  enableProgressBar: true,
                                  enableSkips: false,
                                  enableOverflowMenu: false,
                                  enableProgressText: false,
                                  enableSubtitles: false,
                                  enablePip: false,
                                  backgroundColor: Color(0xFFFFFFFF),
                                  controlsHideTime: Duration(milliseconds: 30),
                                  controlBarColor: Color(0xf000000),
                                  enableQualities: false,
                                  playerTheme: BetterPlayerTheme.cupertino,
                                  controlBarHeight: 40,


                                )
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(10),
                    )),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/imges/p2.webp'),
                              backgroundColor: mc,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('حسناء محمد',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                Text('منذ 2 ساعة')
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Text('متابعة'),
                              highlightColor: mc,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('افضل مطعم داخل كفرالشيخ'),
                          InkWell(
                              onTap: () {
                              },
                              child: Text('كفرالشيخ', style: TextStyle(color: mc, fontWeight: FontWeight.bold,), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),

                    Padding(

                      padding: const EdgeInsets.only(right: 8,left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,

                          child: BetterPlayer.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            betterPlayerConfiguration: BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                controlsConfiguration: BetterPlayerControlsConfiguration(
                                  enableProgressBar: true,
                                  enableSkips: false,
                                  enableOverflowMenu: false,
                                  enableProgressText: false,
                                  enableSubtitles: false,
                                  enablePip: false,
                                  backgroundColor: Color(0xFFFFFFFF),
                                  controlsHideTime: Duration(milliseconds: 30),
                                  controlBarColor: Color(0xf000000),
                                  enableQualities: false,
                                  playerTheme: BetterPlayerTheme.cupertino,
                                  controlBarHeight: 40,


                                )
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(10),
                    )),
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage('assets/imges/p2.webp'),
                              backgroundColor: mc,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('حسناء محمد',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                Text('منذ 2 ساعة')
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              child: Text('متابعة'),
                              highlightColor: mc,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_vert_rounded)),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('افضل مطعم داخل كفرالشيخ'),
                          InkWell(
                              onTap: () {
                              },
                              child: Text('كفرالشيخ', style: TextStyle(color: mc, fontWeight: FontWeight.bold,), textAlign: TextAlign.right)),
                        ],
                      ),
                    ),

                    Padding(

                      padding: const EdgeInsets.only(right: 8,left: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,

                          child: BetterPlayer.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            betterPlayerConfiguration: BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                                controlsConfiguration: BetterPlayerControlsConfiguration(
                                  enableProgressBar: true,
                                  enableSkips: false,
                                  enableOverflowMenu: false,
                                  enableProgressText: false,
                                  enableSubtitles: false,
                                  enablePip: false,
                                  backgroundColor: Color(0xFFFFFFFF),
                                  controlsHideTime: Duration(milliseconds: 30),
                                  controlBarColor: Color(0xf000000),
                                  enableQualities: false,
                                  playerTheme: BetterPlayerTheme.cupertino,
                                  controlBarHeight: 40,


                                )
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );

  }
}
class TopRevItem extends StatelessWidget {
  final TopReviewer model;
  final String cert = 'assets/svg/cert.svg';

  const TopRevItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
      onTap: () {},
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          lc,
                          sc,
                        ],
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd),
                    borderRadius:
                    BorderRadius.all(Radius.circular(100))),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Container(
                    padding: EdgeInsets.all(3),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(50))),
                    child: CircleAvatar(
                      backgroundImage:
                      AssetImage(model.image),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(model.name)
            ],
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              bottom: 23,
            ),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(
                backgroundColor: ulc(model.ul),
                child: SvgPicture.asset(
                  cert,
                  color: Colors.white,
                  semanticsLabel: 'role',
                  height: 15,
                ),
                radius: 15,
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
}

