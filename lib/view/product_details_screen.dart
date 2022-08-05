import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cosmetic_skin_app/models/product_data.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final productData = Provider.of<ProductData>(context).products.firstWhere((prodId) => productId == prodId.id);
    final moreProducts = Provider.of<ProductData>(context).products;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://www.bga.fi/cache/2d/1200x1200-Affischer-Posters_2019-12_utan-kant_Mysterious_forest1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: Container(
                  height: 180,
                width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(productData.imageUrl),
                        fit: BoxFit.fill
                    ),
                  ),
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: const BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.search),
                                  Text('Top 5', style: TextStyle(fontSize: 24, color: Colors.white),),
                                  Icon(Icons.search),
                                ],
                              ),
                            ),
                            Text(productData.title, style: const TextStyle(fontSize: 32, color: Colors.white),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 152,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(productData.description, style: const TextStyle(fontSize: 20, color: Colors.white),),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: const [
                              CircleAvatar(
                                radius: 20,
                                  child: Icon(Icons.play_arrow),
                              ),
                              SizedBox(height: 15,),
                              Text('See all', textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 360,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(moreProducts[index].imageUrl),
                                      fit: BoxFit.fill
                                    )
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

          ],
        ),
      ),
    );
  }
}
