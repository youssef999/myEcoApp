import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/helper/extinstion.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';

class CartProductModel {
  String name, image, price, productId,brand,brand_email;
  int quantity;


  CartProductModel(
      {this.name, this.image, this.quantity, this.price,
        this.productId,this.brand,this.brand_email});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    final box = GetStorage();

    final box_country=box.read('country')??'x';


    // if(box_country=='امارات'){
    //   price =map['priceAmar'];
    // }
    // if(box_country=='البحرين'){
    //   price =map['priceBh'];
    // }
    // if(box_country=='قطر'){
    //   price =map['priceQ'];
    // }
    // if(box_country=='سلطنة عمان'){
    //   price =map['priceAm'];
    // }
    //
    // if(box_country=='كويت'){
    //   price =map['priceQw'];
    // }
    // if(box_country=='السعودية'){
    //   price =map['price'];
    // }
    // if(box_country=='x'){
    //   price =map['price'];
    // }

    price=map['price'];
    productId = map['productid'];
    brand=map['brand'];
    brand_email=map['brandemail'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productId,
      'brand':brand,
      'brandemail':brand_email
    };
  }
}
