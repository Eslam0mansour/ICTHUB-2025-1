import 'package:first/models/product_model.dart';
import 'package:flutter/material.dart';

class GridAndStackView extends StatelessWidget {
  GridAndStackView({super.key});

  final List<ProductModel> myList = [
    ProductModel(id: 1, title: "Product 1", price: 100),
    ProductModel(id: 2, title: "Product 2", price: 200),
    ProductModel(id: 3, price: 300),
    ProductModel(id: 4, title: "Product 3", price: 300),
    ProductModel(id: 5, title: "Product 3", price: 300),
    ProductModel(id: 6, title: "Product 3", price: 300),
    ProductModel(id: 7, title: "Product 3", price: 300),
    ProductModel(id: 8, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
    ProductModel(id: 9, title: "Product 3", price: 300),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: Text("Products"),
              centerTitle: true,
            )
          : AppBar(
              title: Text("Our Products"),
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // count of items in a cross axis
            crossAxisCount:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 2
                    : 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 2,
            childAspectRatio: 4 / 4,
          ),
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      myList[index].id.toString(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      myList[index].title ?? "No Product title",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      myList[index].price.toString(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
