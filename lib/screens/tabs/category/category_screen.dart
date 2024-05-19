import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model.dart';
import '../../../view_model/category_view_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text("Categories",style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CategoriesViewModel>().insertCategory(
                CategoryModel(
                  imageUrl:
                  "https://i.pinimg.com/736x/58/61/3e/58613ea92fab875a49fec23e7538b0a6.jpg",
                  categoryName: "Accessories",
                  docId: "",
                ),
                context,
              );
            },
            icon: const Icon(Icons.add,color: Colors.black,),
          ),
        ],
      ),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoriesViewModel>().listenCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            List<CategoryModel> list = snapshot.data as List<CategoryModel>;
            return ListView(
              children: [
                ...List.generate(
                  list.length,
                      (index) {
                    CategoryModel category = list[index];
                    return ListTile(
                      leading: Image.network(
                        category.imageUrl,
                        width: 150,
                        height: 150,
                      ),
                      title: Text(category.categoryName),
                      subtitle: Text(category.docId),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CategoriesViewModel>()
                                    .deleteCategory(category.docId, context);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                context
                                    .read<CategoriesViewModel>()
                                    .updateCategory(
                                  CategoryModel(
                                    imageUrl:
                                    "https://dnr.wisconsin.gov/sites/default/files/feature-images/ECycle_Promotion_Manufacturers.jpg",
                                    categoryName: "Telephones",
                                    docId: category.docId,
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