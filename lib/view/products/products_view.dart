





// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';


class ProductsView extends StatefulWidget {

  String br;

  ProductsView({this.br});

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<ProductsView> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    final box = GetStorage();
    num price;
    final box_country=box.read('country');

    return Scaffold(
        backgroundColor: Colors.white,
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
                        width: 25,
                      ),
                      Row(
                        children: [

                          Text(
                            "Luban   ",
                            style: TextStyle(
                                color: HexColor("#ff68682A"),
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width:70,
                            child: Image.asset("assets/wh3.jpeg",
                              fit:BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80,
                      ),

                    ],
                  ))),
        ),
        body:
        Container(
          color: Colors.white,
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('products')
                      .where('brand',isEqualTo:widget.br)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                          default:
                            return GridView.builder(
                                itemCount: snapshot.data.documents.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 3,

                                ), //(orientation == Orientation.portrait) ? 2: 2.2),
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),

                                      builder: (controller) => Container(
                                          padding: EdgeInsets.all(5),
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.grey[100],
                                              child: Column(children: [
                                                SizedBox(height: 20),
                                                Container(
                                                  width: 150,
                                                  height: 90,
                                                  child: Image.network(
                                                      posts.data()['image'],
                                                      fit: BoxFit.fitWidth),
                                                ),
                                                SizedBox(height: 2),

                                                Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:16,
                                                    fontWeight:FontWeight.bold),),
                                                SizedBox(height: 2),


                                                if(box_country=='السعودية')
                                                  Text((posts.data()['price']).toString(),
                                                    style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                        fontWeight:FontWeight.bold),
                                                  ),

                                                if(box_country=='قطر')
                                                  Text((posts.data()['priceQ']).toString(),
                                                    style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                        fontWeight:FontWeight.bold),
                                                  ),


                                                if(box_country=='كويت')
                                                  Text((posts.data()['priceQw']).toString(),
                                                    style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                        fontWeight:FontWeight.bold),

                                                  ),

                                                if(box_country=='سلطنة عمان')
                                                  Text((posts.data()['priceAm']).toString(),
                                                    style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                        fontWeight:FontWeight.bold),

                                                  ),

                                                if(box_country=='البحرين')
                                                  Text((posts.data()['priceBh']).toString(),
                                                    style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                        fontWeight:FontWeight.bold),

                                                  ),



                                                if(box_country=='الكويت')
                                                Text((posts.data()['priceQw']).toString(),
                                                  style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                      fontWeight:FontWeight.bold),

                                                ),
                                                if(box_country=='امارات')
                                                Text((posts.data()['priceAmar']).toString(),
                                  style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                  fontWeight:FontWeight.bold)),




                                              ]),
                                            ),
                                            onTap: () {


                                              if(box_country=='امارات'){
                                                price=posts.data()['priceAmar'];
                                              }
                                              if(box_country=='الكويت'){
                                                price=posts.data()['priceQw'];
                                              }
                                              if(box_country=='البحرين'){
                                                price=posts.data()['priceBh'];
                                              }
                                              if(box_country=='سلطنة عمان'){
                                                price=posts.data()['priceAm'];
                                              }
                                              if(box_country=='قطر'){
                                                price=posts.data()['priceQ'];
                                              }
                                              if(box_country=='السعودية'){
                                                price=posts.data()['price'];
                                              }
                                              if(box_country=='x'){
                                                price=posts.data()['price'];
                                              }

                                              Get.to(DetailsView2(
                                                name: posts.data()['name'],
                                                price: price,
                                                x:posts.data()['x'],
                                                details: posts.data()['des'],
                                                image: posts.data()['image'],
                                                productId:posts.data()['productid'],
                                                brand:posts.data()['brand'],
                                                brandemail:posts.data()['brandemail']
                                              ));
                                            },
                                          )));
                                });
                        }
                      }),
                ),
                //),
                //  ]),
              ] ),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }