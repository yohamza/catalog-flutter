import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'dart:convert';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var products = decodedData["products"];
    CatalogModel.catalogs =
        List.from(products).map((item) => CatalogItem.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Catalog App",
                textScaleFactor: 3.0,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Trending Products",
                textScaleFactor: 1.5,
              ),
              SizedBox(
                height: 20.0,
              ),
              (CatalogModel.catalogs != null &&
                      CatalogModel.catalogs!.isNotEmpty)
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: CatalogModel.catalogs!.length,
                        itemBuilder: (context, index) {
                          final item = CatalogModel.catalogs![index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeDetail(catalog: item),
                                ),
                              );
                            },
                            child: ItemWidget(
                              item: item,
                            ),
                          );
                        },
                      ),
                    )
                  : Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
