// EX UI에 바인드할 요소를 지정한다.
import 'package:get/get.dart';
import 'package:getx_shopping_cart/model/product.dart';

class ShoppingController extends GetxController {
  // UI에 바인드 한다 = observable로 만든다.
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    // api 콜을 하는 경우에는 해당 컨트롤러가 생성될 때 관련 api를 불러와야한다.
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    var productData = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description',
        productName: 'keyboard',
      ),
      Product(
        id: 2,
        price: 30,
        productDescription: 'some description',
        productName: 'keyboard',
      ),
      Product(
        id: 3,
        price: 30,
        productDescription: 'some description',
        productName: 'keyboard',
      ),
      Product(
        id: 4,
        price: 30,
        productDescription: 'some description',
        productName: 'keyboard',
      ),
      Product(
        id: 5,
        price: 30,
        productDescription: 'some description',
        productName: 'keyboard',
      ),
    ];

    // EX 현재 리스트 내에 있는 모든 아이템을 인자값으로 받는 아이템으로 대체해준다.
    products.assignAll(productData);
  }
}
