import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testzaina/widget/text1.dart';
import 'package:testzaina/widget/textFilde.dart';

import '../../cubit/product/cubit_product.dart';
import '../../cubit/product/state_product.dart';
import '../../widget/DefaultButton.dart';

class add_product extends StatefulWidget {

  @override
  State<add_product> createState() => _add_productState();
}

class _add_productState extends State<add_product> {
  //const add({super.key});
  var nameproduct=TextEditingController();
  var description_product=TextEditingController();
  var price_product=TextEditingController();
  var quantity_product=TextEditingController();
  var formkay =GlobalKey<FormState>();
  late Position L;
  late Position LL;
  var L1;
  var L2;
List address1=[];
  String selectgetcategory ='food';
  String selectstatus ='new';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>product_cubit(),
    child: BlocConsumer<product_cubit,state_product> (
        listener:(context,state){},
    builder: (context,state) {
                return Scaffold(


        appBar: AppBar(backgroundColor: Color(0xFF439A97),

        ),
body: SingleChildScrollView(
  child:   Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        color: Colors.grey[190],
        child:   Form(
          key: formkay,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[

            SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'name product :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.text ,     controller: nameproduct,
                validate1: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the name product';
                  }
                  return null;
                },),


              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'description :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.text,controller: description_product, validate1: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter ';
                }
                return null;
              },),



            SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'price :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.number ,controller: price_product,
                validate1: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter ';
                  }
                  return null;
                },),



            SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'quantity :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DefaultTextaField(hint: '',color: Colors.white,r: 0,type:TextInputType.number ,controller: quantity_product,
                validate1: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter ';
                }
                return null;
              },
              ),



            SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'category :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DropdownButton(
                isExpanded: true,
                value: selectgetcategory,
                items:
                [
                //getcategory().toList(),
                  DropdownMenuItem(child:Text("furniture") ,value:   "furniture"),
                  DropdownMenuItem(child:Text( "accessories") ,value:  "accessories"),
                  DropdownMenuItem(child:Text("food") ,value: "food"),
                  DropdownMenuItem(child:Text("clothes") ,value: "clothes"),
                  DropdownMenuItem(child:Text("shoes") ,value: "shoes"),
                  DropdownMenuItem(child:Text("gifts") ,value: "gifts"),
                  DropdownMenuItem(child:Text("books") ,value: "books"),
                  DropdownMenuItem(child:Text("technology") ,value: "technology"),
                ],

                onChanged:(value){
                  setState(() {
                        selectgetcategory=value!;
                            print(value);
                            });


                }),



            SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text1( text: 'status :',size: 18,fontWeight:FontWeight.w400),
              ),
              SizedBox(height: 10,),
              DropdownButton(
                padding:  EdgeInsets.only(left: 8.0),
                  isExpanded: true,
                  value: selectstatus,
                  items: [
                    DropdownMenuItem(child:Text('new') ,value: 'new'),
                    DropdownMenuItem(child:Text("old") ,value: "old"),
                 ],
                  onChanged:(value){
                    setState(() {
                      selectstatus=value!;
                      print(value);
                    });
                  }),

              SizedBox(height: 10,),

             Center(
               child: DefaultButton(onTap:() async {
                 getlocation();
                 LL=await getlocat();
                 print(' llll =${L.longitude}');
                 print(' llll =${L.latitude}');
                          },
               text: 'Click here to access your location',
                 w: 300,

               ),
             ),
              SizedBox(height: 10,),
              Center(
                child: DefaultButton(text: 'Add Product',
                    color: Color(0xFF439A97), s: 20,r: 30,w: 200,
                    onTap: () {
                  address1.add(LL.longitude);
                  address1.add(LL.latitude);
                      if (formkay.currentState!.validate()) {
                        print(L.longitude);
                        product_cubit.product(context).addproduct(
                            name: nameproduct.text,
                            price: int.parse(price_product.text),
                            quantity: int.parse(quantity_product.text),
                            category: selectgetcategory.toString(),
                            status: selectstatus.toString(),
                            description: description_product.text,
                            image: 'cccccccccccccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccc',
                            address: address1,
                        );
                      };
                      print("lllll${LL.altitude }");
                                  }),
              ),
            ],
          ),
        ),
       ),
      ),
      )
      );
    },



    ) );
  }


   getlocation() async {
    bool service;
    LocationPermission permission;
    service= await Geolocator.isLocationServiceEnabled();
    if (!service){
      AlertDialog(title: Text('Pleas open GPS'),);
    }
    permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
  }
    if (permission == LocationPermission.always){
       getlocat();

    }
   }

   Future<Position> getlocat()async{
    Position? po=  await Geolocator.getCurrentPosition().then((value) => value);
    //Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)

    setState(() {
      L = po!;
    });
   // return await Geolocator.getCurrentPosition().then((value) => value);
     return L;
   }
    //   permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();

 // }



  // List<DropdownMenuItem<String>> getcategory(){
  //   List<String> categories=[
  //     "furniture",
  //     "accessories",
  //     "food",
  //     // "clothes",
  //     // "shoes",
  //     // "books",
  //     // "gifts",
  //     // "technology",
  //   ];
  //  final List<DropdownMenuItem<String>> dropdownitem =[];
  //   int i;
  //   for ( i=0 ; i<=categories.length; i++){
  //      String category=categories[i];
  //   var newitem=DropdownMenuItem(child:Text(category) ,value: category,);
  //      dropdownitem.add(newitem);
  //   }
  //   return  dropdownitem;
  //
  //
  // }
}
