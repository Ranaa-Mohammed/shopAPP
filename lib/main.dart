import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop/cubit_shop.dart';
import 'package:shop_app/screens/shop_home.dart';
import 'package:shop_app/shared/cache_helper.dart';

 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper().init();
// bool OnBoarding = CacheHelper().getData(key: 'OnBoarding');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CubitShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShopHome(),
      ),
    );
  }
}

