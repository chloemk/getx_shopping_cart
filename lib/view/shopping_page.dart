import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

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
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Product name',
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text('Product description'),
                                ],
                              ),
                              const Text(
                                '\$30',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Add to cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Total amount',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
