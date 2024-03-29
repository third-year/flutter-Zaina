import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testzaina/cubit/login/cubit.dart';
import 'package:testzaina/cubit/login/states.dart';
import 'package:testzaina/screen/login/signin.dart';
import '../../widget/DefaultButton.dart';
import '../../widget/text1.dart';
import '../../widget/textFilde.dart';


class newpassword extends StatelessWidget {
  dynamic code1;
  var passcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkay =GlobalKey<FormState>();

newpassword({required this.code1});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>ELoginCubit(),
        child: BlocConsumer<ELoginCubit,ELoginSates> (
        listener:(context,state){
      if(state is NewSuccessState){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => sign()),);
      }


    },
    builder:(context,state) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(image:  AssetImage('assets/images/12.png'),fit: BoxFit.cover)
      ),child: ListView(
        children:[ Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key:formkay ,

            child: Column(children: [

              SizedBox(height: 140,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text1(text: 'Set new password',size: 30,color: Colors.yellow[700],),
                    SizedBox(height: 25,),
                    Text1(text: 'Must be at least 8 characters',
                      fontWeight: FontWeight.w300,
                      size: 20,), ],
                ),
              ),



              SizedBox(height: 20,),
              DefaultTextaField(hint: 'Password',icon: Icons.lock,color1: Color(0xFF439A97),
                  controller: passcontroller,
                  color: Colors.grey[300],
                  validate1:   ( value){
                    if(value==null ||value.isEmpty){ return 'please enter your new password';}
                    return null;},

                  obscure:  ELoginCubit.get(context).ispassword,
                  suffixPressed: (){
                    ELoginCubit.get(context).changpassword();
                  },
                  type: TextInputType.visiblePassword,
                  suffix: ELoginCubit.get(context).suffix,


              ),


              SizedBox(height: 25,),
              DefaultTextaField(hint: 'Confirm Password',
                controller: passwordcontroller,
                color: Colors.grey[300],color1: Color(0xFF439A97),
                validate1:   ( value){
                  if(value==null ||value.isEmpty){ return 'please enter your password';}
                  return null;},
                obscure:  ELoginCubit.get(context).ispassword,
                suffixPressed: (){
                  ELoginCubit.get(context).changpassword();
                },
                type: TextInputType.visiblePassword,
                suffix: ELoginCubit.get(context).suffix,
              ),
              SizedBox(height: 40,),
              DefaultButton(text: 'Reset password',color:Color(0xFF439A97),


                w: 180, h: 60, onTap: (){

                  // ELoginCubit.get(context).newpaasswordc(password: passcontroller.text, conpassword: passwordcontroller.text);
                  print('${code1}');
                          if(formkay.currentState!.validate()){
                    ELoginCubit.get(context).newpaasswordc(
                        password: passcontroller.text,
                        conpassword: passwordcontroller.text,
                        code1: code1.toString(),
                    );
                  }

                },s: 25,)
            ],),
          ),
        ),
        ]),



    ));
    }
    ));
  }

}
