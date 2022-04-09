






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/products/details_view2.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class CategoryProducts extends StatefulWidget {

  String cat;

  CategoryProducts({this.cat});


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<CategoryProducts> {

  String allposts;
  String v;
  Future resultsLoaded;


  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();




  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              height: 30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.62
                      ),

                      SizedBox(
                          width: 5
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
                       .where('cat',isEqualTo:widget.cat)
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
                                              color:Colors. white,
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
                                                Text((posts.data()['price']).toString(),
                                                  style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                      fontWeight:FontWeight.bold),

                                                ),
                                              ]),
                                            ),
                                            onTap: () {
                                              Get.to(DetailsView2(
                                                name: posts.data()['name'],
                                                price: posts.data()['price'],
                                                details: posts.data()['des'],
                                                image: posts.data()['image'],
                                                productId:posts.data()['productid'],
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
