import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _imgIndex = 0;
  int _colorIndex = 1;
 final List<Map<String,dynamic>> _prodImg = [
    {
      "id":1,
      "url": "https://m.media-amazon.com/images/I/418QpEn9JKL._AC_UF894,1000_QL80_DpWeblab_.jpg"
    },
    {
      "id":2,
      "url": "https://www.ikea.com/in/en/images/products/stefan-chair-brown-black__0727320_pe735593_s5.jpg?f=s"
    }
  ];
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(0.5),
            size: 28,
          )),
      actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.local_mall_outlined,color: Colors.black.withOpacity(0.5),
                  size: 28,)),
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
      appBar: appBar,
      body: Column(
        children: [
          GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details){
             if(details.primaryVelocity! >0){
               setState(() {
                 _imgIndex = 0;
               });
             }else if(details.primaryVelocity! < 0  ){
              setState(() {
                _imgIndex = 1;
              });
             } 
            },
            child: Container(
              width: 1.sw,
              height: 1.sh/2,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(_prodImg[_imgIndex]['url']))
              ),
              child: Container(
                margin: EdgeInsets.only(top: 250.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 3,
                      color: _imgIndex == 0?Colors.black:Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: 100,
                      height: 3,
                      color: _imgIndex == 1?Colors.black:Colors.black.withOpacity(0.5),
                    ),
              
                  ],
                ),
              )
            ),
          ),
          Divider(endIndent: 150,height: 10,indent: 150,color: Colors.black,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h,),
                SizedBox(width:1.sw,child: Text('Modern Dining Chair',style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),)),
                SizedBox(height: 5.h,),
                 SizedBox(width:1.sw,child: Row(children: [
                  Text('4.3',style: TextStyle(color: Colors.amber,fontSize: 16),),
                   RatingBarIndicator(
                    rating: 4.5,
                    itemCount: 5,
                    itemSize: 20.0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Text('(137 Reviews)',style: TextStyle(color: Colors.grey,fontSize: 14.sp),)
                 ],)),
                 SizedBox(height: 5.h,),
                 SizedBox(
                  width: 1.sw,
                  child: Row(
              
                     children: [{
                      "id":1,
                      "color": Colors.black
                     },{
                      "id":2,
                      "color": Colors.grey
                     },{
                      "id":3,
                      "color": Colors.yellow
                     }].map((e) => Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: CircleAvatar(
                        radius: 14,
                        backgroundColor: _colorIndex == e['id'] as int?e['color'] as Color:Colors.transparent,
                         child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                           child: ColorIndicator(
                            onSelect: (){
                              setState(() {
                                _colorIndex =  e['id'] as int;
                                print(_colorIndex);
                              });
                            },
                               width: 20,
                                       height: 20,
                                       borderRadius: 20,
                                       color: e['color'] as Color,
                           ),
                         ),
                       ),
                     )).toList()
                    ,
                  ),
                 ),
                 SizedBox(height: 5.h,),
                 Text('Description',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                 SizedBox(height: 2.h,),
                 Text('Our chair has a seat and backrest made of a material resistant to dirt and abrasion, and a frame made of beach wood',style: TextStyle(color: Colors.grey,fontSize: 16.sp),),
                 Spacer(),
                 SizedBox(width: 1.sw,child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white
                            ),
                            child: Center(child: Icon(Icons.remove,size: 14,)),
                          ),
                          Text('1'),
                           Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black
                            ),
                            child: Center(child: Icon(Icons.add,size: 14,color: Colors.white,)),
                          ),

                        ],
                      ),
                    ),
                     Container(
                      width: 1.sw - 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Add to Cart',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                            VerticalDivider(thickness: 3),
                            Text('\$40.00',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),)
                          ],
                        ),
                      ),
                    )
                  ],
                 ),)
              ],
                      ),
            ))
        ],
      ),
    );
  }
}
