import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testzaina/cubit/product/state_product.dart';
import 'package:testzaina/network/dio_helper.dart';

import '../../network/end_point.dart';

class product_cubit extends Cubit<state_product>{
  product_cubit():super(productIntialState());
  static product_cubit product(context)=>BlocProvider.of(context);

  void addproduct({
  required name,
  required price,
    required quantity,
    required category,
    required status,
    required description,
    required image,
     required address,
  })
  {
    emit(productLoadState());
    DioHelper.postData(url1: url+'/v1/product',
      data: {
    'name':name,
'description':description,
      'price':price,
      'image':image,
      'quantity':quantity,
      'address':address,
      'category':category,
      'status':status,

    }
    ,).then((value) {

      print(value.data);
      emit(productSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(productErrorState());


  });

}}