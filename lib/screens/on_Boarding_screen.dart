import 'package:flutter/material.dart';
import 'package:shop_app/components/on_boarding_item.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/screens/shop_login_screen.dart';
import 'package:shop_app/shared/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
   OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
 var pageController = PageController();
 bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'images/shop/undraw_shopping_app_flsj-removebg-preview.png',
        title: 'on boarding title 1',
        body: 'on boarding body 1',
    ),
    BoardingModel(
      image: 'images/shop/undraw_shopping_app_flsj-removebg-preview.png',
      title: 'on boarding title 2',
      body: 'on boarding body 2',
    ),
    BoardingModel(
      image: 'images/shop/undraw_shopping_app_flsj-removebg-preview.png',
      title: 'on boarding title 3',
      body: 'on boarding body 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
               CacheHelper().setData(key: 'OnBoarding', value: true).then((value){
                 if(value){
                   Navigator.pushAndRemoveUntil(
                       context, MaterialPageRoute(builder: (context) => LoginScreen(),),
                           (rout){
                         return false;
                       }
                   );
                 }
               });
              },
              icon: Text('Skip',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 16,
                ),
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index){
                  if(index == boarding.length -1){
                    setState(() {
                      isLast = true;
                    });
                    print('Last');
                  }else{
                    setState(() {
                      isLast = false;
                    });
                    print('not Last');
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context,index) => OnBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
              SizedBox(height: 40,),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageController,
                      count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 3,
                      dotWidth: 10,
                      spacing: 5,
                     // activeDotColor: Colors.pink,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                     backgroundColor: Colors.indigo,
                      onPressed: (){
                       CacheHelper().setData(key: 'OnBoarding', value: true);
                       if(isLast){
                         Navigator.pushAndRemoveUntil(
                           context, MaterialPageRoute(builder: (context) => LoginScreen(),),
                             (rout){
                             return false;
                             }
                         );
                       }
                       else{
                         pageController.nextPage(
                           duration: Duration(
                             milliseconds: 750,
                           ),
                           curve: Curves.fastLinearToSlowEaseIn,);}
                      },
                    child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
