import 'package:contact_app/data/product.dart';

class Products{


static  List<Product> list_products=[Product("","",""),Product("","","")];
}

class Use{

  use(){

    Products.list_products.forEach((product){

      print(product);
    });
  }
}
