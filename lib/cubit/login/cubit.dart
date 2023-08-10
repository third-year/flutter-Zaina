import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testzaina/cubit/login/states.dart';
import 'package:testzaina/network/dio_helper.dart';

import '../../models/login_model.dart';
import '../../network/end_point.dart';

class ELoginCubit extends Cubit<ELoginSates>{

  ELoginCubit():super(LoginInitialState());
   static ELoginCubit get(context)=>BlocProvider.of(context);
  late  Login_Models loginModel;
  void userlogin({
    required String email,
    required String password
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
        url1: url+'/v1/user/login',
        data: {
          'email':email,
          'password':password,
        }
    ).then((value) {
      loginModel=Login_Models.fromjson(value.data);
      print(value.data);
      emit(LoginSuccessState(loginModel));

    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void forgetpaasswordc({
    required String email,

  }){
    emit(ForgetLoadingState());
    DioHelper.postData(
        url1: url+'/v1/user/forgotPassword',
        data: {
          'email':email,
        }
    ).then((value) {
      print(value.data);
      emit(ForgetSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(ForgetErrorState());
    });
  }


  void codepaasswordc({
    required String code,

  }){
    emit(CodeLoadingState());
    DioHelper.getData(url: url+'/v1/user/checkResetToken/'+code,
    ).then((value) {
      print(value.data);
      emit(CodeSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(CodeErrorState());
    });
  }
  void newpaasswordc({
    required String password,
    required String conpassword,
    required String code1

  }){
    emit(NewLoadingState());
    DioHelper.postData(
        url1: url+'/v1/user/resetPassword/$code1',
        data: {

          'password':password,
          'passwordConfirm':conpassword

        }
    ).then((value) {
      print(value.data);
      emit(NewSuccessState());

    }).catchError((error){
      print(error.toString());
      print('$url/v1/user/resetPassword/$code1');
      emit(NewErrorState());
    });
  }
  IconData suffix = Icons.visibility_off_outlined;
  bool ispassword = true;
  void changpassword(){
    ispassword=!ispassword;
    suffix =ispassword? Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ShopChangePasswordd());
  }
}