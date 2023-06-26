

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class States extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:
      Scaffold(backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Visibility(
            visible: false,
            child: const BackButton(

            ),
          ),
          title: const Text(
            'المحافظات',
            style: TextStyle(
              color: Color(0xFF0E7886),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              color: const Color(0xFFFFFFFF),
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF0E7886),
                size: 20.0,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            IconButton(
              color: const Color(0xFFFFFFFF),
              onPressed: () {},
              icon: const Icon(
                Icons.list_rounded,
                color: Color(0xFF0E7886),
                size: 20.0,
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
          ],
          elevation: 0.0,
          bottom: ButtonsTabBar(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            borderWidth: 2.0,
            unselectedBorderColor: Colors.transparent,
            borderColor: const Color(0xFF0E7886),
            backgroundColor: const Color(0xFFEFF4F5),
            unselectedBackgroundColor: const Color(0xEEF5F5F5),
            tabs: const [
              Tab(
                icon: Text(
                  'صعيد مصر',
                  style: TextStyle(
                    color: Color(0xFF0E7886),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'الوجه البحري',
                  style: TextStyle(
                    color: Color(0xFF0E7886),
                    fontWeight: FontWeight.bold,

                  ),
                ),
              ),
            ],
          ),
        ),
        body:
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: TabBarView(children: [
            Container(
              child: upperEgyptLayout(context),
            ),
            Container(
              margin: const EdgeInsets.all(12.0),
              child: lowerEgyptLayout(context),
            ),

          ]),
        ),
      ),
    );
  }
}
final upperCity = ['الأقصر', 'أسوان', 'الفيوم', 'سوهاج'];
final lowerCity = ['القاهرة', 'الاسكندرية', 'الجيزة'];

Widget upperEgyptLayout(BuildContext context) {
  return MasonryGridView.count(
    scrollDirection: Axis.vertical,
    itemCount: upperCity.length,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    itemBuilder: (context, index) {
      return Container(

        child: ClipRRect(

          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: const BoxDecoration(


              gradient: LinearGradient(
                colors: [
                  Color(0x330E7886),
                  Color(0x33FF757C),
                ],

                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 12,
                  end: 9,
                  start: 8,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: AssetImage('assets/imges/u$index.jpg'))),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {},
                  child: Text(
                    upperCity[index],
                    style: const TextStyle(
                        color: Color(0xFFFF757C), fontWeight: FontWeight.w600),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF757C),
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );
}

Widget lowerEgyptLayout(BuildContext context) {
  return MasonryGridView.count(
    scrollDirection: Axis.vertical,
    itemCount: lowerCity.length,
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    itemBuilder: (context, index) {
      return Container(


        child: ClipRRect(

          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            decoration: const BoxDecoration(


              gradient: LinearGradient(
                colors: [
                  Color(0x330E7886),
                  Color(0x33FF757C),
                ],

                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 12,
                  end: 9,
                  start: 8,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(image: AssetImage('assets/imges/l$index.jpg'))),
              ),
              ListTile(
                title: TextButton(
                  onPressed: () {},
                  child: Text(
                    lowerCity[index],
                    style: const TextStyle(
                        color: Color(0xFFFF757C), fontWeight: FontWeight.w600),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFFF757C),
                ),
              ),
            ]),
          ),
        ),
      );
    },
  );
}