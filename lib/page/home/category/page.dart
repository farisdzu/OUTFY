import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final List<String> categories = [
    'All',
    'Shirt',
    'Pants',
    'Hoodie',
    'Glasses',
    'Bag',
    'Slipper',
    'Shoes',
    'Accessories',
  ];

  String selectedCategory = 'All'; // Menyimpan kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35, // Tinggi kategori
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory; // Cek apakah kategori terpilih

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = category; // Set kategori yang dipilih
                });
                print('Selected category: $category');
              },
              child: Container(
                alignment: Alignment.center, // Untuk meratakan teks di tengah
                padding: EdgeInsets.symmetric(horizontal: 12), // Padding horizontal di dalam item
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: isSelected ? Colors.grey[200] : Colors.transparent, // Warna latar belakang untuk kategori aktif
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal, // Menebalkan teks kategori yang terpilih
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
