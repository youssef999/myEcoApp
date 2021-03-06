import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_check.dart';
import 'package:ecommerce/view/widgets/custom_formfield.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'checkout_screen2.dart';



class AdressScreen extends StatefulWidget {
  //List<>String name;
  num total;
  List<CartProductModel> cartmodel;
  double lat,long;
  //String address;
  AdressScreen({this.total,this.cartmodel,this.lat,this.long});

  @override
  State<AdressScreen> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<AdressScreen> {
  String brand_email;


  @override
  Widget build(BuildContext context) {
    TextEditingController address3= TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final box = GetStorage();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    // Colors.white,
                    Colors.white,
                    //Colors.lightBlueAccent,

                    // Colors.lightBlueAccent,
                    Colors.white,
                  ])),
              height: 30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          // Text(
                          //   "Luban   ",
                          //   style: TextStyle(
                          //       color: HexColor("#ff68682A"),
                          //       fontSize: 22,
                          //       fontWeight: FontWeight.w700),
                          // ),
                          SizedBox(
                            width: 200
                          ),
                          Container(
                            width:60,
                            child: Image.asset("assets/wh3.jpeg",
                              fit:BoxFit.cover
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),

                    ],
                  ))),

        ),
        body: GetBuilder<AddressViewModel>(
          init:AddressViewModel(),
          builder:(controller)=>
              SingleChildScrollView(
                child: Directionality(
                  textDirection:TextDirection.rtl,
                  child: Container(
                      child:  Form(
                        key: _formKey,
                        child: Column(
                        //  crossAxisAlignment:CrossAxisAlignment.baseline,
                            children:[
                              SizedBox(
                                  height:30
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.country,
                                        hint: '???????????? ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.country.text= value;
                                          print("ttt ="+controller.country.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {
                                            return ("???????? ???????????? ");
                                          }
                                        }
                                    ),
                                  ),

                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.city,
                                        hint: '?????????????? ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.city.text= value;
                                          print("ttt ="+controller.city.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {
                                            return (" ???????? ?????????????? ");
                                          }
                                        }
                                    ),
                                  ),

                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.address,
                                        hint: '?????????? ????????????  ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.address.text= value;
                                          print("ttt ="+controller.address.toString());
                                        },
                                        validator: (value) {
                                          if (value == null || value=='' ) {
                                            return ("???????? ??????????????  ");
                                          }
                                        }
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller:controller.apartment,
                                        hint: '?????? ????????????   ',
                                        text:'',
                                        color:Colors.black,
                                        onSave: (value) {
                                          controller.apartment .text= value;
                                        },
                                        // validator: (value) {
                                        //   if (value == null|| value=='' ){
                                        //     return ("Enter apartment ");
                                        //   }
                                        // }
                                    ),
                                  ),
                                  Container(
                                    padding:EdgeInsets.only(left:30),
                                    width:330,
                                    child: CustomFormField(
                                        controller: controller.floor,
                                        hint: '?????? ??????????  ',
                                        text: '',
                                        color:Colors.black,
                                        onSave: (value) {
                                          print("lll= "+value);
                                          controller.floor.text= value;
                                        },
                                        validator: (value) {
                                          if (value == null|| value=='') {
                                            return ("???????? ?????? ??????????  ");
                                          }
                                        }
                                    ),
                                  ),

                                  Directionality(
                                    textDirection:TextDirection.ltr,
                                    child: Row(
                                      children: [

                                        SizedBox(
                                          width:40
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:28.0),
                                        child: DropdownButton<String>(
                                        value: controller.dropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.green,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            controller.dropdownValue = newValue;
                                            print(controller.dropdownValue);
                                          });
                                        },
                                        items: <String>['+968', '+971', '+965', '+974','+966','+973']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    ),
                                      ),
                                        SizedBox(
                                            width:11
                                        ),
                                        Container(
                                         // padding:EdgeInsets.only(left:30),
                                          width:250,
                                          child: CustomFormField(
                                              controller:controller.mobile,
                                              hint: '?????? ????????????',
                                              text:'',
                                              color:Colors.black,
                                              onSave: (value) {
                                                controller.mobile.text= value;
                                              },
                                              validator: (value) {
                                                if (value == null || value==''|| value.length<7|| value.length>15) {
                                                  return (" ???????? ?????? ???????? ????????");
                                                }
                                              }
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height:20
                              ),
                              Container(
                                child: RaisedButton(
                                  color: HexColor("#ff68682A"),
                                  onPressed: () {
                                   // print("brand"+brandname);
                                    //print("emmmaill="+brand_email);
                                    //print(cartmodel[3].name);
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      print("add2222");
                                      print("cont" + controller.address.toString());
                                      controller.addAddress();
                                      print("add1111");
                                      box.write('Adress_details1',
                                        controller.address.text.toString(),);

                                      box.write('Adress_details2', controller.apartment.text.toString(),);
                                      box.write('Adress_details3', controller.floor.text.toString(),);
                                      box.write('Adress_details4', controller.dropdownValue+controller.mobile.text.toString(),);
                                      box.write('Adress_country', controller.country.text.toString(),);
                                      box.write('Adress_city', controller.city.text.toString(),);
                                      box.write('Lat', widget.lat,);
                                      box.write('Long',widget.long);
                                       //Get.to(AddressCheck());
                                      Get.to( CheckOutScreen2(
                                          controller.country.text.toString(),
                                          controller.city.text.toString(),
                                          controller.address.text.toString(),
                                          controller.apartment.text.toString(),
                                          controller.floor.text.toString(),
                                          controller.dropdownValue+controller.mobile.text.toString(),
                                          widget.total,
                                          widget.cartmodel,
                                          brand_email,
                                        //  brandname,
                                          widget.lat,
                                          widget.long
                                      ));
                                    }

                                    else{
                                      Get.snackbar('?????? ??????', '?????????? ???????????? ???????????? ??????????');
                                    }
                                  },
                                  child:Text("?????????? ??????????",style:TextStyle(
                                      color:Colors.white,
                                      fontSize:22),),
                                ),
                              )
                            ]
                        ),
                      )
                  ),
                ),
              ),
        )
    );
  }
}