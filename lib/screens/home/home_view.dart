import 'package:class04/data/data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> _productList = productList;
  List _categories =
      productList.map((product) => product.category).toSet().toList();
  List<Product> _favItems = [];
  List<Product> _filteredList = [];

  updateFavItems() {
    _favItems = productList.where((product) => product.isFav).toList();
  }

  updateFilteredList(String category) {
    _filteredList =
        productList.where((product) => product.category == category).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _productList.length,
                itemBuilder: (context, index) {
                  final item = _productList[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    leading: IconButton(
                        onPressed: () {
                          item.isFav = !item.isFav;
                          updateFavItems();
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: item.isFav ? Colors.red : Colors.grey,
                        )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  List<Product> filteredList = [];

                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          updateFilteredList(_categories[index]);
                          // setState(() {});
                        },
                        child: Text(
                          _categories[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ));
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _filteredList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredList[index].name),
                  );
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: _favItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_favItems[index].name),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
