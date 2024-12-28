import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop/cubit_shop.dart';
import 'package:shop_app/cubits/shop/states_shop.dart';


class ShopHome extends StatelessWidget {
  const ShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitShop, ShopStates>(
        listener: (BuildContext context, ShopStates state){},
        builder: (BuildContext context, ShopStates state){
          CubitShop cubit = BlocProvider.of(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('test'),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottom(index);
              },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'Category',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ]
            ),
          );
        },
        );
  }
}



























//
//
// TextButton(
// onPressed: (){
// CacheHelper().deleteItem(key: 'token',);
// Navigator.pushAndRemoveUntil(
// context, MaterialPageRoute(builder: (context) => LoginScreen(),),
// (rout){
// return false;
// }
// );
// },
// child: Text('sign out'),
// ),