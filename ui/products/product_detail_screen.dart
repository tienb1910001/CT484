import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/products.dart';
import 'package:myshop/ui/cart/cart_screen.dart';

import '../cart/cart_manager.dart';
class ProductDetailScreen extends StatelessWidget{
  static const routeName ='/product-detail';

  const ProductDetailScreen(
      this.product,{
        super.key,
      }
      );
  final Product product;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: 110,
                decoration: BoxDecoration(
                  color:
                  product.isFavorite ? const Color.fromARGB(255, 190, 189, 123) : const Color.fromARGB(255, 127, 179, 157),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 92, 92, 92),
                    fontSize: 20,
                  ),
                ),
              ),
            ),


            Padding(
              padding:
              const EdgeInsets.only(top: 20),
              child: Text(
                product.title,
                //style: Theme.of(context).textTheme.headline6,
                style: const TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,

              child: Text(
                product.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            Container(
              decoration: const BoxDecoration(
                // color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 70,
                  bottom: 40,
                  top: 15,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 50),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    // primary: Colors.white,
                    backgroundColor: Colors.amber[300],
                  ),
                  // onPressed: press as void Function()?,
                  onPressed: () {
                    final cart = context.read<CartManager>();
                    cart.addItem(product);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Item added to cart',
                          ),
                          duration: const Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              cart.removeSingleItem(product.id!);
                            },
                          ),
                        ),
                      );
                  },
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}