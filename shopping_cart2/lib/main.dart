import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      title: "Shopping Cart",
      home: ShoppingCart(
        products: <Product>[
          Product(name: "Eggs1"),
          Product(name: "Eggs2"),
          Product(name: "Eggs3"),
          Product(name: "Bread"),
        ],
    ),
  ));
}

class Product
{
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool incart);

class ShoppingList extends StatelessWidget {
  final Product product;
  final bool incart;
  final CartChangedCallback onCartChanged;

  const ShoppingList({this.product, this.incart, this.onCartChanged});


  Color _getcolor(BuildContext context) {
    if (!incart)
      return Theme.of(context).primaryColor;
    else
      return Colors.black54;
  }

  TextStyle _getTextStyle() {
    if (!incart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, incart);
      },
      leading: CircleAvatar(
        backgroundColor: _getcolor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name,
                  style: _getTextStyle(),
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  final List<Product> products;
  ShoppingCart({Key key, this.products}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Title"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingList(
            product: product,
            incart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}