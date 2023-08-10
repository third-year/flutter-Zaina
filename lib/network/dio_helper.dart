//import 'package:dio/dio.dart';

//import 'end_points.dart';

import 'package:dio/dio.dart';

import 'end_point.dart';

class DioHelper{


  static late Dio dio;

  static init(){
    dio =Dio(
        BaseOptions(responseType: ResponseType.json,
          baseUrl: url,
          receiveDataWhenStatusError: true,
// headers: {
//          'Content-Type':'application/json',
//   'Accept':'application/json',
//
// }
        ));}

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>?  query,
    String ?token,
  })async
  {  dio.options.headers= {

    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':token??''

  };
  return await dio.get(url,queryParameters:query,);

  }


  static Future<Response> postData({
    required String url1,
    required Map<String,dynamic> data,
  })async{

    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json',
      //'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0YjgzNGU1M2JlZmFiNmE3MGYzOTYzMyIsImlhdCI6MTY5MTA2NzI0NCwiZXhwIjoxNjkxNjcyMDQ0fQ.kBq-d1Ot7gaksYQjZ9sc6-9p5Zm_-yNElwyXN782DeE'
    };

    Response response = await dio.post(url1, data: data);

    return  await dio.post(url1,data: data);

  }



}


