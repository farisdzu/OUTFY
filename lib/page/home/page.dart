import 'package:flutter/material.dart';
import 'package:myoutfy/page/home/card/product_card.dart'; // Import the ProductCard class
import 'package:myoutfy/page/home/card/card.dart'; // Import the product data
import '../../preference/colors.dart';
import 'category/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void toggleFavorite(int index) {
    setState(() {
      products[index].isFavorite = !products[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Change to your preferred color
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200], // Change to your preferred color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Notification logic here
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Popular Items',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
              Container(
                width: double.infinity,
                height: 176,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Special For Today \nUp To 58%',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'New style for your life',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 102,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(23),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/h&m.png',
                              height: 30,
                            ),
                            Text(
                              'Buy H&M',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              CategorySection(),
              SizedBox(height: 20),
              Text('Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: products.length, // Use the imported products list
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: products[index],
                      onFavoriteToggle: () => toggleFavorite(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
