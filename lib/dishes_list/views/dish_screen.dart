import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nortvis/dishes_list/models/dishes_model.dart';
import 'package:nortvis/dishes_list/view_models/dishes_view_model.dart';
import 'package:provider/provider.dart';

class DishesScreen extends StatefulWidget {
  const DishesScreen({super.key});

  @override
  State<DishesScreen> createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  ScrollController? _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DishesViewModel dishesViewModel = context.watch<DishesViewModel>();
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
        IconButton(
            //constraints: BoxConstraints(maxWidth: 30),
            onPressed: () {},
            icon: Badge.count(
                smallSize: 5,
                count: 0,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black.withOpacity(0.5),
                  size: 28,
                )))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          double initPix = 0;
          if (details.primaryVelocity! > 0) {
            // User swiped Left
            print('User swiped Left');
            setState(() {
              if (_currentIndex != 0) {
                initPix -= 50;
                _controller!.jumpTo(initPix);

                _currentIndex--;
              }
            });
          } else if (details.primaryVelocity! < 0) {
            print('User swiped Right');
            setState(() {
              if (_currentIndex !=
                  dishesViewModel.dishes[0].tableMenuList.length - 1) {
                initPix += 50;
                _controller!.jumpTo(initPix);
                _currentIndex++;
              }
            });
            // User swiped Right
          }
        },
        child: Container(
          child: Column(
            children: [_ui(dishesViewModel)],
          ),
        ),
      ),
    );
  }

  _ui(DishesViewModel dishesViewModel) {
    if (dishesViewModel.loading) {
      return SizedBox(
          width: 1.sw,
          height: 1.sh - 150,
          child: Center(child: CircularProgressIndicator()));
    }
    if (dishesViewModel.userError.code != null &&
        dishesViewModel.userError.code != 200) {
      return SizedBox(
          width: 1.sw,
          height: 1.sh - 150,
          child: Center(child: Text('Something went wrong')));
    }
    return Expanded(
        child: ListView.builder(
            itemBuilder: (context, index) {
              DishModel dishModel = dishesViewModel.dishes[index];
              return Container(
                width: 1.sw,
                height: 1.sh - 50,
                child: Column(
                  children: [
                    menuItem(dishModel.tableMenuList),
                    Expanded(
                        child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (ctx, ind) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 1.sw - 30,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 15,
                                          height: 15,
                                          margin: EdgeInsets.only(top: 5),
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor: ind % 2 == 0
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SizedBox(
                                          width: 1.sw - 130,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dishModel
                                                    .tableMenuList[
                                                        _currentIndex]
                                                    .categoryDishes[ind]
                                                    .dishName,
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              SizedBox(
                                                  width: 1.sw,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          '${dishModel.tableMenuList[_currentIndex].categoryDishes[ind].dishCurrency.name} ${dishModel.tableMenuList[_currentIndex].categoryDishes[ind].dishPrice}',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 20),
                                                        child: Text(
                                                            '${dishModel.tableMenuList[_currentIndex].categoryDishes[ind].dishCalories} Calories',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ),
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(dishModel
                                                  .tableMenuList[_currentIndex]
                                                  .categoryDishes[ind]
                                                  .dishDescription),
                                              SizedBox(
                                                height: 8.h,
                                              ),
                                              Container(
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    color: Colors.green),
                                                child: Center(
                                                  child: Text(
                                                    '-    0    +',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              if (ind == 0)
                                                Text(
                                                  'Customization Available',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                Image(
                                              image: AssetImage(
                                                  'assets/nopreview.png'),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Image(
                                              image: AssetImage(
                                                  'assets/nopreview.png'),
                                            ),
                                            imageUrl: dishModel
                                                .tableMenuList[_currentIndex]
                                                .categoryDishes[ind]
                                                .dishImage,
                                          ),
                                          // child: Image.network(
                                          // dishModel
                                          //     .tableMenuList[_currentIndex]
                                          //     .categoryDishes[ind]
                                          //     .dishImage
                                          // ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // child: Text(dishModel.tableMenuList[_currentIndex].categoryDishes[ind].dishName),
                      ),
                      itemCount: dishModel
                          .tableMenuList[_currentIndex].categoryDishes.length,
                    ))
                  ],
                ),
              );
            },
            itemCount: dishesViewModel.dishes.length));
  }

  Widget menuItem(List<TableMenuList>? table) => Container(
        width: 1.sw,
        height: 40.h,
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (ctx, index) => InkWell(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: Container(
              width: 150,
              height: 40.h,
              child: Column(
                children: [
                  Text(
                    table[index].menuCategory,
                    style: TextStyle(
                        color:
                            _currentIndex == index ? Colors.red : Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Divider(
                    color: _currentIndex == index
                        ? Colors.red
                        : Colors.transparent,
                    thickness: 3,
                  )
                ],
              ),
            ),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: table!.length,
        ),
      );
}
