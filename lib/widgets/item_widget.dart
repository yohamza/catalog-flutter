import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class ItemWidget extends StatelessWidget {
  final CatalogItem item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0.0,
        margin: EdgeInsets.only(bottom: 15.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          10.0,
        )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Hero(
                tag: Key(item.id.toString()),
                child: Container(
                  decoration: BoxDecoration(
                      color: MyTheme.creamColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 120.0,
                  width: 130.0,
                  child: Image.network(item.image),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${item.price.toString()}",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: MyTheme.darkBluishColor,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {},
                        child: Text("Add to cart"),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(StadiumBorder()),
                            backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor,
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
