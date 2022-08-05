import 'package:cosmetic_skin_app/models/product_data.dart';
import 'package:cosmetic_skin_app/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  static const routeName = '/product-overview';

  @override
  Widget build(BuildContext context) {
    final loadedProductsData = Provider.of<ProductData>(context).products;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://www.guerlain.com/on/demandware.static/-/Sites-GSA_FR_Storefront_catalog_DO_NOT_TOUCH/default/dwceb10ef6/HeroBanner_NewTemplate/MUP/Foundation/fond_De_teint_W_828x828.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(ProductDetailsScreen.routeName, arguments: loadedProductsData[index].id);
                      },
                      child: Container(
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(loadedProductsData[index].imageUrl),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 70,
                width: double.infinity,
                child: Container(
                   height: 75,
                   width: MediaQuery.of(context).size.width * 0.95,
                   decoration: const BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(70),
                       topRight: Radius.circular(70),
                       bottomLeft: Radius.circular(70),
                       bottomRight: Radius.circular(70),
                     ),
                   ),
                  child: Center(
                      child: Text('Welcome to the store', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),)),
                 ),
              ),
            ),
          ],
        ),
      ),

    );

  }
}
