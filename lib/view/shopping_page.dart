import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/controller/cart_controller.dart';
import 'package:getx_shopping_cart/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);

  // EX DI생성.
  // EX 한번 DI되면 다시 생성 할 필요는 없다. 설령 다른 페이지로 이동해도 Get.find 메서드로 얼마든지 controller를 불러올 수 있기 때문이다.
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            'GetX 쇼핑카트',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.red,
        // EX 컬럼 위젯 내에서 ListView 위젯을 불러왔을 때 반드시 Expanded 위젯으로 감싸줘야지 정상적으로 출력이 된다.
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Expanded(
              // EX 임시방편으로 streamBuilder로 만들었다가 바꿈
              // EX 이 controller를 통해서 모든 데이터 정보를 가져올 수 있다.
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToItem(controller.products[index]);
                              },
                              child: const Text('Add to cart'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.products.length,
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount : \$ ${controller.totalPrice}',
                style: const TextStyle(fontSize: 22, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text(
            'item',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          icon: const Icon(Icons.add_shopping_cart_rounded),
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}
