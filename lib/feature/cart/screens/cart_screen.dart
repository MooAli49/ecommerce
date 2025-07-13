import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/test_chair.jpg',
      'assets/images/test_chair.jpg',
      'assets/images/test_chair.jpg',
      'assets/images/test_chair.jpg',
      'assets/images/test_chair.jpg',
    ];
    List<String> names = [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 4',
      'Product 5',
    ];
    List<double> prices = [29.99, 49.99, 19.99, 39.99, 59.99];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 90,
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                names[index],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //TODO implement quantity change
                                IconButton(
                                  padding: EdgeInsets.zero,

                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                ),
                                Text('1'),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$${prices[index].toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${prices.reduce((a, b) => a + b).toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //TODO implement checkout
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
