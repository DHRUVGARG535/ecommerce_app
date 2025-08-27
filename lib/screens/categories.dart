import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> categories = [
      {"name": "Hoodies", "image": "assets/images/Ellipse 1.png"},
      {"name": "Accessories", "image": "assets/images/Ellipse 2.png"},
      {"name": "Shorts", "image": "assets/images/Ellipse 3-1.png"},
      {"name": "Shoes", "image": "assets/images/Ellipse 3.png"},
      {"name": "Bags", "image": "assets/images/Ellipse 4.png"},
    ];

    return Scaffold(
        appBar: AppBar(
        title: Text(
          "Shop by Categories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true, // ye default back button dikhata hai
      ),
     
    
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          

             

              // Category List
              Expanded(
                child: ListView.separated(
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Row(
                        children: [
                          // Image
                          Image.asset(
                            item["image"]!,
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 12),

                          // Text
                          Text(
                            item["name"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
