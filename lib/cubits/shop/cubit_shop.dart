import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/shop/states_shop.dart';
import 'package:shop_app/dio/dio_Login.dart';
import 'package:shop_app/dio/endPoint.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/screens/favorites_screen.dart';
import 'package:shop_app/screens/products_screen.dart';
import 'package:shop_app/screens/setting_screen.dart';

import '../../models/Categories_model.dart';

class CubitShop extends Cubit<ShopStates> {

  CubitShop() : super(ShopInitializeStates());

  static CubitShop get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];


  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavStates());
  }

  HomeModel? homeModel;
  Map<int, bool> favorite = {};

  getProduct() {
    // emit(ShopLoadingStates());
    //print('hehej1');
    DioHelper().getData(
      url: HOME,
      token: token,
      lang: 'en',
    ).then((value) {
      //print('heheje ${value.data}');
      // emit(ShopSuccessStates());
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products?.forEach((element) {
        favorite.addAll({
          element.id!: element.inFavorites!,
        });
      });
      // print(favorite.toString());
      emit(ShopSuccessStates());
    }).catchError((error) {
      print('error ${error.toString()}');
      emit(ShopErrorStates());
    });
  }


  // bool isPassword = true;
  // Icon suffixIcon = Icon(Icons.visibility_outlined) ;
  // void changePasswordVisible(){
  //   isPassword = !isPassword;
  //   suffixIcon = isPassword ? Icon(Icons.visibility_outlined) :  Icon(Icons.visibility_off_outlined);
  //
  //   emit(ShopChangePasswordVisible());
  // }

  CategoriesModel? categoriesModel;

  getCategories() {
    DioHelper().getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesStates());
    });
  }


}
