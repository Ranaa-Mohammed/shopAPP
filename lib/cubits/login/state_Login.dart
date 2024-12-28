 import 'package:shop_app/models/shop_login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates {}

 class ShopLoginLoadingState extends ShopLoginStates {}

 class ShopLoginSuccessState extends ShopLoginStates {
 final ShopLoginModel shopLoginModel;

  ShopLoginSuccessState(this.shopLoginModel);
 }

 class ShopLoginErrorState extends ShopLoginStates {
  final String errorMesage;

  ShopLoginErrorState({required this.errorMesage});
 }


 class ShopChangePasswordVisible extends ShopLoginStates {}