import 'package:egyuide/layout/cubit/cubit.dart';
import 'package:egyuide/layout/cubit/states.dart';
import 'package:egyuide/modules/user/login.dart';
import 'package:egyuide/utilities/cache_helper.dart';
import 'package:egyuide/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  String? image = 'a';
  String? lottieBuilder = 'a';
  final String title;
  final String body;

  OnBoardingModel(
      {this.image, required this.title, required this.body, this.lottieBuilder});
}

class Onboard extends StatefulWidget {
  Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  List<OnBoardingModel> boardingItems = [
    OnBoardingModel(
      image: 'assets/imges/amico.png',
      lottieBuilder: 'a',
      title: 'اهلا بك في ايجي جايد',
      body:
      'هل انت في زيارة لأماكن جديدة ولا تعلم ماذا تفعل؟ في ايجي جايد نساعدك على تحديد موقعك ومعرفة ما يمكنك فعله أين تأكل! وأين تستريح! وأين أقرب فندق لك!',
    ),
    OnBoardingModel(
      image: 'a',
      lottieBuilder: 'assets/json/on2.json',
      title: 'قائمة بأفضل المطاعم',
      body:
      'هل أنت جائع الأن ؟ نعطيك قائمة بأفضل المطاعم في المدينة التي انت فيها وبتقييمات مصورة داخل المطاعم وعربات الاكل المتنقلة لكي تختار الاكل المناسب لك',
    ),

    OnBoardingModel(
      image: 'a',
      lottieBuilder: 'assets/json/on3.json',
      title: 'تقييمات لجميع الأماكن',
      body: '      تقييمات كاملة لأشهر المطاعم والأماكن السياحية مع تجربة حصرية بالفيديو لجميع الأماكن داخل مصر',
    ),
  ];

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      OnBoardingItem(
                        model: boardingItems[index],
                      ),
                  itemCount: boardingItems.length,
                  controller: pageController,
                  physics: BouncingScrollPhysics(),
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.1),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                  SmoothPageIndicator(
                  controller: pageController,
                  count: boardingItems.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: sc,
                    dotHeight: 7,
                    dotWidth: 7,
                    spacing: 10,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          if (pageController.page!.toInt() ==
                              boardingItems.length - 1) {
                            CacheHelper.saveData(key: 'onBoarding', value: true);
                            NavigateToAndFinish(context, widget: LogIn());
                          } else {
                            pageController.nextPage(
                                duration: Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeInOutExpo);
                          }
                        });
                      },
                      minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  color: sc,
                  child: Text(
                    'التالي',
                    style: TextStyle(fontSize: 17,),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        onPressed: () {
                          CacheHelper.saveData(key: 'onBoarding', value: true);
                          NavigateToAndFinish(context, widget: LogIn());
                        },
                        minWidth: MediaQuery.of(context).size.width,
                        height: 50,
                        color: cubit.darkMode ? Colors.grey : Color(0xfffde2e4) ,
                        child: Text(
                          'تخطي',
                          style: TextStyle(fontSize: 17,color: cubit.darkMode ? Colors.white : Color(0xffFF757C),),
                        ),
                      ),
                    ),
              Material(
                borderRadius: BorderRadius.circular(20),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        ],
      ),)
      ,
      );
      },
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(model.image == 'a')
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LottieBuilder.asset(model!.lottieBuilder ?? 'asd'),
          ),
        if(model.lottieBuilder =='a')
          Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image(
            image: AssetImage(model!.image ?? 'p1') ,
            width: 320,
          ),
        ),


        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 50,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model.title,
                  style: const TextStyle(
                    color: sc,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  model.body,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
