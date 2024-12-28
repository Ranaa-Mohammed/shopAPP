import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/login/state_Login.dart';
import 'package:shop_app/dio/dio_Login.dart';
import 'package:shop_app/dio/endPoint.dart';
import 'package:shop_app/models/shop_login_model.dart';
class ShopLoginCubit extends Cubit<ShopLoginStates> {

  ShopLoginCubit() : super(ShopLoginInitialState()) ;

  static ShopLoginCubit get(context) => BlocProvider.of(context);


  void Login({required String email, required String password}){
    emit(ShopLoginLoadingState());
    DioHelper().postData(
        url: LOGIN,
        data: {
          'email' : email,
          'password' : password,
        },
    ).then((value){
      ShopLoginModel shopLoginModel =
     ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(shopLoginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(errorMesage: error.toString()));
    });
  }



bool isPassword = true;
  Icon suffixIcon = Icon(Icons.visibility_outlined) ;
  void changePasswordVisible(){
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icon(Icons.visibility_outlined) :  Icon(Icons.visibility_off_outlined);

    emit(ShopChangePasswordVisible());
  }

}