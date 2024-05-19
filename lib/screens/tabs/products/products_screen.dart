import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/product_models.dart';
import '../../../view_model/product_view_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text("Products",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductsViewModel>().insertProducts(
                ProductModel(
                  price: 12.5,
                  imageUrl:
                  "https://d3chjy2wsvtsxc.cloudfront.net/1.d/preview/f/0/f00a58b2_97a322b5_iPhone-13-Pro-Max-014.png",
                  productName: "iPhone 14 pro",
                  docId: "",
                  productDescription: "productDescription",
                  categoryId: "kcggCJzOEz7gH1LQy44x",
                ),
                context,
              );
            },
            icon: const Icon(Icons.add,color: Colors.black,),
          ),
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsViewModel>().listenProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> list = snapshot.data as List<ProductModel>;
            return ListView(
              children: [
                ...List.generate(
                  list.length,
                      (index) {
                    ProductModel product = list[index];
                    return ListTile(
                      leading: Image.network(
                        product.imageUrl,
                        width: 200,
                        height: 200,
                      ),
                      title: Text(product.productName),
                      subtitle: Text(product.docId),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ProductsViewModel>()
                                    .deleteProduct(product.docId, context);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<ProductsViewModel>().updateProduct(
                                  ProductModel(
                                    price: product.price,
                                    imageUrl:
                                    "https://upload.wikimedia.org/wikipedia/commons/2/2c/NOKIA_1280.jpg",
                                    productName: "Galaxy",
                                    docId: product.docId,
                                    productDescription: "",
                                    categoryId: product.categoryId,
                                  ),
                                  context,
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}