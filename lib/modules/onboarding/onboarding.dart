import 'package:egyuide/layout/home.dart';
import 'package:egyuide/modules/user/login.dart';
import 'package:egyuide/utilities/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/imges/amico.png'),
                        width: double.infinity,
                      ),
                      Text(
                        'اهلا بك في ايجي جايد ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'هل انت في زيارة لأماكن جديدة ولا تعلم ماذا تفعل؟     في ايجي جايد نساعدك علي تحديد موقعك ومعرفة ما يمكنك ان تفعله أين تأكل!  وأين تستريح!  واين أقرب فندق لك! ',
                          style:
                              TextStyle(color: Color(0xff8c8c8c), fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LottieBuilder.asset('assets/json/on2.json'),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'قائمة بأفضل المطاعم',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'هل انت جائع الأن ؟ نعطيك قائمة بأفضل المطاعم في المدينة التي انت فيها وبتقييمات مصورة داخل المطاعم وعربات الاكل المتنقلة لكي تختار الاكل المناسب لك',
                          style:
                              TextStyle(color: Color(0xff8c8c8c), fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LottieBuilder.asset('assets/json/on3.json'),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'تقييمات لجميع الأماكن',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'تقييمات كاملة لأشهر المطاعم والأماكن السياحية مع تجربة حصرية بالفيديو لجميع الأماكن داخل مصر',
                          style:
                              TextStyle(color: Color(0xff8c8c8c), fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
                controller: controller,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: JumpingDotEffect(
                    activeDotColor: Color(0xe400658c),
                    dotWidth: 30,
                    dotHeight: 5)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(12.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 0,
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Color(0xffff757c))),
                  child: MaterialButton(
                    onPressed: () {
                      CacheHelper.saveData(key: 'onBoarding', value: true);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ));
                    },
                    child: Text('تخطي', style: TextStyle(color: Colors.black)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 0,
                    bottom: 0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color(0xffff757c),
                      border: Border.all(color: Color(0xffff757c))),
                  child: MaterialButton(
                    onPressed: () {
                      if (controller.page!.round() == 2) {
                        CacheHelper.saveData(key: 'onBoarding', value: true);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LogIn(),
                        ));
                      } else {
                        controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceIn);
                      }
                    },
                    child:
                        Text('التالي', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
