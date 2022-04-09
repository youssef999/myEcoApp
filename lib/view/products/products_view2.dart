





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

  String cat;

  ProductsView({this.cat});


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
  void initState() {


    super.initState();
  }


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
          color: Colors.blue,
          child: Column(
              children: [

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('products') .where('cat',isEqualTo:widget.cat)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return GridView.builder(
                                itemCount: snapshot.data.documents.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 3,),


                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) => Container(
                                        height:1400,
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.white,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(height:3,),
                                                    Container(
                                                      width: 230,
                                                      height: 120,
                                                      child: Image.network(
                                                          posts.data()['image'],
                                                          fit: BoxFit.scaleDown),
                                                    ),
                                                    SizedBox(height:6),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          width:100,
                                                          child: Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:16,
                                                              fontWeight:FontWeight.bold),),
                                                        ),
                                                        SizedBox(height: 6),

                                                        Row(
                                                          children: [
                                                            SizedBox(width:50,),
                                                            Text((posts.data()['price']).toString(),
                                                              style:TextStyle( color:Colors.blue,fontSize:16,
                                                                  fontWeight:FontWeight.bold),
                                                            ),
                                                            Text(("  LE"),
                                                              style:TextStyle( color:Colors.blue,fontSize:16,
                                                                  fontWeight:FontWeight.bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),
                                            onTap: () {


                                              Get.to(DetailsView2(
                                                  name: posts.data()['name'],
                                                  price: posts.data()['price'],
                                            //      x:posts.data()['x'],
                                                  details: posts.data()['des'],
                                                  image: posts.data()['image'],
                                                  productId:posts.data()['productid'],
                                              //    brand:posts.data()['brand'],
                                                //  brandemail:posts.data()['brandemail']
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

