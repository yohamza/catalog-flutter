import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class HomeDetail extends StatelessWidget {
  final CatalogItem catalog;

  const HomeDetail({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${catalog.price.toString()}",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            ElevatedButton(
              onPressed: () => {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 15.0),
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 17.0),
                ),
              ),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  )),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Container(
                color: MyTheme.creamColor,
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: Image.network(catalog.image)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    catalog.name,
                    textScaleFactor: 2.5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    catalog.desc,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ullamcorper ornare egestas. Quisque dignissim ipsum vitae vulputate consectetur. Morbi bibendum orci eu dui mollis, sed vulputate ante interdum. Proin id elementum purus. Suspendisse vitae dignissim sapien, eget sodales sapien. Cras a elementum mi, nec consectetur massa. Morbi maximus, justo et.",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
