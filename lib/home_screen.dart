import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './dishes_list/views/dish_screen.dart';
import 'dart:math' as math;

import './product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black.withOpacity(0.5),
            size: 28,
          )),
      actions: [
        IconButton(
            //constraints: BoxConstraints(maxWidth: 30),
            onPressed: () {},
            icon: Badge(
                smallSize: 10,
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black.withOpacity(0.5),
                  size: 28,
                )))
      ],
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appBar,
      bottomNavigationBar: BottomAppBar(
        // elevation: 0,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => DishesScreen()));
                },
                icon: Transform.rotate(
                    angle: 270 * math.pi / 180,
                    child: Icon(Icons.dashboard_customize_outlined))),
            IconButton(onPressed: () {}, icon: Icon(Icons.local_mall_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person_outline))
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 1.sw,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFF0F4FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                decoration: InputDecoration(
                  //fillColor: Color(0xFFF0F4FF),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search Furniture',
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Recommended',
              style: TextStyle(
                  fontSize: 16.sp, color: Colors.black.withOpacity(0.5)),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 250.h,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  product(
                      imgUrl:
                          'https://m.media-amazon.com/images/I/418QpEn9JKL._AC_UF894,1000_QL80_DpWeblab_.jpg',
                      name: 'Mid century Modern arm chair',
                      price: '\$40.00'),
                  product(
                      imgUrl:
                          'https://rukminim1.flixcart.com/image/416/416/xif0q/bed/z/4/g/-original-imagztbymrvgd5vf.jpeg?q=70',
                      name: 'NEUDOT PARIS QUEEN',
                      price: '\$140.00'),
                  product(
                      imgUrl:
                          'https://rukminim1.flixcart.com/image/416/416/kqzj7gw0/bed/i/a/a/single-na-wrought-iron-no-folding-bed-with-6inches-mattress-original-imaff5yfnxxtr9sn.jpeg?q=70',
                      name: 'SPRINGTEK Folding Bed',
                      price: '\$20.00'),
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Recently Viewed',
              style: TextStyle(
                  fontSize: 16.sp, color: Colors.black.withOpacity(0.5)),
            ),
            Expanded(
                child: ListView(
              children: [
                recentlyViewed(
                    name: 'Mid century Modern arm chair',
                    img:
                        'https://m.media-amazon.com/images/I/418QpEn9JKL._AC_UF894,1000_QL80_DpWeblab_.jpg',
                    price: '\$40.00'),
                recentlyViewed(
                    name: 'NEUDOT PARIS QUEEN',
                    img:
                        'https://rukminim1.flixcart.com/image/416/416/xif0q/bed/z/4/g/-original-imagztbymrvgd5vf.jpeg?q=70',
                    price: '\$140.00'),
                recentlyViewed(
                    name: 'SPRINGTEK Folding Bed',
                    img:
                        'https://rukminim1.flixcart.com/image/416/416/kqzj7gw0/bed/i/a/a/single-na-wrought-iron-no-folding-bed-with-6inches-mattress-original-imaff5yfnxxtr9sn.jpeg?q=70',
                    price: '\$20.00'),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget product({
    String? name,
    String? imgUrl,
    String? price,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => ProductScreen()));
        },
        child: Container(
          width: 250.w,
          height: 250.h,
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160.w,
                    height: 60.h,
                    child: Text(
                      name!,
                      //'Modern Dining Chair',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 20.h,
                    margin: EdgeInsets.only(top: 6.h),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'NEW',
                      style: TextStyle(fontSize: 12.sp),
                    )),
                  )
                ],
              ),
              Text(price!),
              SizedBox(
                height: 6.h,
              ),
              Image.network(
                imgUrl!,
                //'https://m.media-amazon.com/images/I/418QpEn9JKL._AC_UF894,1000_QL80_DpWeblab_.jpg',
                fit: BoxFit.cover,
                width: 120.w,
                height: 120.h,
              )
            ],
          ),
        ),
      );
  Widget recentlyViewed({String? name, String? img, String? price}) => Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Image.network(img!
                      //'https://m.media-amazon.com/images/I/418QpEn9JKL._AC_UF894,1000_QL80_DpWeblab_.jpg'
                      )),
              SizedBox(
                width: 150.w,
                height: 50.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      //'Mid century Modern arm chair',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Sofas',
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              Text(
                price!,
                //'\$264.00',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      );
}
