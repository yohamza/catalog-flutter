import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/theme.dart';

class CartPage extends StatelessWidget {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _cart.catalogItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.done),
                        title: Text("Item $index"),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.minus_circle)),
                      );
                    }),
              ),
              BottomBarCart(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarCart extends StatefulWidget {
  const BottomBarCart({
    Key? key,
  }) : super(key: key);

  @override
  _BottomBarCartState createState() => _BottomBarCartState();
}

class _BottomBarCartState extends State<BottomBarCart> {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$9999",
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluishColor),
        ),
        ElevatedButton(
          onPressed: () => {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Buying not supported yet."),
            ))
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Text(
              "Buy",
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
    );
  }
}
