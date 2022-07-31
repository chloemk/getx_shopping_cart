import 'package:get/get.dart';
import 'package:getx_shopping_cart/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  // EX fold는 reduce와 같은 함수
  // EX cartItems가 초기화되지 않아 getter를 사용해야하는데
  // EX 초기화 된 값을 getter가 복사해서 가지고온다고 보면 된다.
  double get totalPrice => cartItems.fold(0, (prev, el) => prev + el.price);
  int get count => cartItems.length;

  void addToItem(Product product) {
    cartItems.add(product);
  }
}
