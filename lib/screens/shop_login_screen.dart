import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/default_textButton.dart';
import 'package:shop_app/components/default_text_form_field.dart';
import 'package:shop_app/cubits/login/cubit_Login.dart';
import 'package:shop_app/cubits/login/state_Login.dart';
import 'package:shop_app/screens/shop_home.dart';
import 'package:shop_app/screens/shop_register_screen.dart';
import 'package:shop_app/shared/cache_helper.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  var emailController = TextEditingController();
   var passwordController = TextEditingController();
   GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: BlocProvider(
       create: (BuildContext context) => ShopLoginCubit(),
       child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
         listener: (BuildContext context, ShopLoginStates state){
           if(state is ShopLoginSuccessState){
             if(state.shopLoginModel.status!){
               print(state.shopLoginModel.message);
               print(state.shopLoginModel.data!.token);
               CacheHelper().setData(key: 'token', value: state.shopLoginModel.data!.token).
               then((value){
                 Navigator.pushAndRemoveUntil(
                     context, MaterialPageRoute(builder: (context) => ShopHome(),),
                         (rout){
                       return false;
                     }
                 );
               });
               Fluttertoast.showToast(
                   msg: state.shopLoginModel.message!,
                   //android
                   toastLength: Toast.LENGTH_LONG,
                   gravity: ToastGravity.BOTTOM,
                   //web
                   timeInSecForIosWeb: 5,
                   backgroundColor: Colors.pink,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }else{
               print(state.shopLoginModel.message);
               Fluttertoast.showToast(
                   msg: state.shopLoginModel.message!,
                   //android
                   toastLength: Toast.LENGTH_LONG,
                   gravity: ToastGravity.BOTTOM,
                   //web
                   timeInSecForIosWeb: 5,
                   backgroundColor: Colors.indigo,
                   textColor: Colors.white,
                   fontSize: 16.0
               );
             }
           }
         },
           builder: (BuildContext context, ShopLoginStates state){
           return Center(
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key: formState,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'LOGIN',
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Text(
                         'Login now to browse our hot offers',
                         style: TextStyle(
                           fontSize: 18,
                           fontWeight: FontWeight.bold,
                           color: Colors.grey,
                         ),
                       ),
                       SizedBox(
                         height: 40,
                       ),
                       DefaultTextFormField(
                         label: 'E-mail address',
                         prefixIcon: Icon(Icons.email_outlined),
                         keyboardType: TextInputType.emailAddress,
                         validator: (value) {
                           if (value!.isEmpty) {
                             return 'please enter your e-mail address';
                           }
                         },
                         controller: emailController,
                       ),
                       SizedBox(
                         height: 30,
                       ),
                       DefaultTextFormField(
                         label: 'Password',
                         prefixIcon: Icon(Icons.lock_outline),
                         suffixIcon:  IconButton(
                             icon: ShopLoginCubit.get(context).suffixIcon,
                           onPressed: (){
                               ShopLoginCubit.get(context).changePasswordVisible();
                           },
                         ),
                         keyboardType: TextInputType.visiblePassword,
                         controller: passwordController,
                         validator: (value) {
                           if (value!.isEmpty) {
                             return 'password is too short';
                           }
                         },
                          obscureText: ShopLoginCubit.get(context).isPassword,
                         onFieldSubmitted: (value){
                           if(formState.currentState!.validate()){
                             ShopLoginCubit.get(context).Login(
                               email: emailController.text,
                               password: passwordController.text,
                             );
                           }
                         },
                       ),
                       SizedBox(
                         height: 40,
                       ),
                      state is ShopLoginLoadingState? Center(child: CircularProgressIndicator()) : DefaultButton(
                         onPressed: (){
                           if(formState.currentState!.validate()){
                             ShopLoginCubit.get(context).Login(
                               email: emailController.text,
                               password: passwordController.text,
                             );
                           }
                         },
                         text: 'LOGIN',
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Don\'t have an acount?',
                             style: TextStyle(
                               color: Colors.grey,
                             ),
                           ),
                           DefaultTextButton(
                             onPressed: (){
                               Navigator.push(
                                 context, MaterialPageRoute(
                                 builder: (context) => RegisterScreen(),
                               ),
                               );
                             },
                             text: 'Register Now',
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
             ),
           );
           },
       ),
     ),
    );
  }
}
