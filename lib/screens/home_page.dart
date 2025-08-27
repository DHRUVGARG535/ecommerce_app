import 'package:ecommerce_app/screens/categories.dart';
import 'package:ecommerce_app/widget/catergories_item.dart';
import 'package:ecommerce_app/widget/top_selling_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: BottomAppBar(
     
        color: Colors.white,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home_outlined,size: 30,color: Colors.black45,)
            ),
            IconButton(
              onPressed: () =>(){},
            icon: Icon(Icons.notifications_outlined,size: 30,color: Colors.black45)
            ),
            IconButton(
              onPressed: () => (){},
              icon: Icon(Icons.receipt_outlined,size: 30,color: Colors.black45)
            ),
            IconButton(
              onPressed: () =>(){},
             icon: Icon(Icons.person_outline_outlined,size: 30,color: Colors.black45)
            ),
          ],
        ),
     ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: AppBar(
            centerTitle: true,
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: AssetImage(
                "assets/images/9a01074dac893c1d51c30d88b1726b28331ca570.png",
              ),
            ),
            title: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Men", style: TextStyle(fontSize: 18)),
                  SizedBox(width: 4),
                  SvgPicture.asset("assets/icons/arrowdown2.svg", height: 18),
                ],
              ),
            ),
            actions: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xFF8E6CEF),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/icons/bag2.svg"),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black54),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: SvgPicture.asset("assets/icons/searchnormal1.svg"),
                  ),
                  filled: true, // background fill enable karega
                  fillColor: Color(0xffF4F4F4), // background color
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30), // round shape
                    borderSide: BorderSide.none, // no border
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                   TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(ctx) => CategoriesScreen()));
                    },
                    child: Text('See All', style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CategorieItem(
                    title: 'Hoddies',
                    image: 'assets/images/Ellipse 1.png',
                  ),
                  SizedBox(width: 10.5),
                  CategorieItem(
                    title: 'Shorts',
                    image: 'assets/images/Ellipse 2.png',
                  ),
                  SizedBox(width: 10.5),
                  CategorieItem(
                    title: 'Shoes',
                    image: 'assets/images/Ellipse 3-1.png',
                  ),
                  SizedBox(width: 10.5),
                  CategorieItem(
                    title: 'Bag',
                    image: 'assets/images/Ellipse 3.png',
                  ),
                  SizedBox(width: 10.5),
                  CategorieItem(
                    title: 'Accesories',
                    image: 'assets/images/Ellipse 4.png',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  Text('See All', style: TextStyle(fontSize: 16)),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TopSellingItem(
                      imagePath: 'assets/images/Rectangle 8.png',
                      title: "Men's Harrington Jacket",
                      price: "\$148.00",
                    ),
                    SizedBox(width: 12),
                    TopSellingItem(
                      imagePath: 'assets/images/Rectangle.png',
                      title: "Max Cirro Men's Slides",
                      price: "\$55.00",
                    ),
                    SizedBox(width: 12),
                    TopSellingItem(
                      imagePath: 'assets/images/image.png',
                      title: "Men's Coaches Jacket",
                      price: "\$66.97",
                    ),
                    SizedBox(width: 12),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New In",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color(0xff8E6CEF),
                    ),
                  ),
                  Text('See All', style: TextStyle(fontSize: 16)),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TopSellingItem(
                      imagePath: 'assets/images/1.png',
                      title: "Men's Harrington Jacket",
                      price: "\$148.00",
                    ),
                    SizedBox(width: 12),
                    TopSellingItem(
                      imagePath: 'assets/images/2.png',
                      title: "Max Cirro Men's Slides",
                      price: "\$55.00",
                    ),
                    SizedBox(width: 12),
                    TopSellingItem(
                      imagePath: 'assets/images/image.png',
                      title: "Men's Coaches Jacket",
                      price: "\$66.97",
                    ),
                
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
