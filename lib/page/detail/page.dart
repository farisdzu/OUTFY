import 'package:flutter/material.dart';

import '../home/page.dart';

void main() {
  runApp(ProductPage());
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // Variabel untuk menyimpan ukuran dan warna yang dipilih
  String selectedSize = 'XL';
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: Colors.black),
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.red),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],

          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                     Image.asset('assets/images/pr1.png', height: 350, ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Image.asset('assets/images/adlv.png', height: 35,),
                    SizedBox(width: 10,),
                    Text(
                      'ADLV Indonesia',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Regular Fit Sequined Shirt',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$138',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '\$238',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.amber),
                    Text('2.0'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Material',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text('Cotton Combad 234 ms'),
                SizedBox(height: 16),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
                ),
                Text(
                  'Regular-fit shirt in a sequined weave with a turn-down collar. '
                      'French front and a yoke at the back. Long sleeves, buttoned cuffs '
                      'and a gently rounded hem. Partly lined.',
                ),
                SizedBox(height: 16),
                Text(
                  'Size',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sizeOption('L'),
                    sizeOption('XL'),
                    sizeOption('XXL'),
                    sizeOption('XXXL'),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Color',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    colorOption(Colors.blue),
                    colorOption(Colors.purple),
                    colorOption(Colors.orange),
                    colorOption(Colors.lightBlue),
                  ],
                ),
                SizedBox(height: 24),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // Aksi saat tombol Buy ditekan
                      },
                      child: Text(
                        'Buy',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk widget opsi ukuran
  Widget sizeOption(String size) {
    bool isSelected = size == selectedSize; // Cek apakah ukuran dipilih
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size; // Ubah ukuran yang dipilih
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.grey[800] : Colors.grey[300], // Ubah warna jika dipilih
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Fungsi untuk widget opsi warna
  Widget colorOption(Color color) {
    bool isSelected = color == selectedColor; // Cek apakah warna dipilih
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color; // Ubah warna yang dipilih
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!, // Border hitam jika dipilih
            width: 3,
          ),
        ),
      ),
    );
  }
}
