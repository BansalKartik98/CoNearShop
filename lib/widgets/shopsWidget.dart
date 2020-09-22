import 'package:flutter/material.dart';
import 'package:flutter_app/animation/RotationRoute.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/DetailsPage.dart';

class ShopsWidget extends StatefulWidget {
  @override
  _ShopsWidgetState createState() => _ShopsWidgetState();
}

class _ShopsWidgetState extends State<ShopsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          BestFoodTitle(),
          Expanded(
            child: ShopsList(),
          )
        ],
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Co-Shops",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class ShopsTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  ShopsTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.rating,
      @required this.numberOfRating,
      @required this.price,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleRoute(page: DetailsPage()));
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/bestfood/' + imageUrl + ".jpeg",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2.5,
                              top: 10,
                              bottom: 10),
                          child: Text(name,
                              style: TextStyle(
                                  color: Color(0xFF6e6e71),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              margin: EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}

class ShopsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ShopsTiles(
            name: "Shop1",
            imageUrl: "ic_best_food_1",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        ShopsTiles(
            name: "Shop2",
            imageUrl: "ic_best_food_2",
            rating: "4.9",
            numberOfRating: "100",
            price: "17.03",
            slug: ""),
        ShopsTiles(
            name: "Shop3",
            imageUrl: "ic_best_food_3",
            rating: "4.0",
            numberOfRating: "50",
            price: "11.00",
            slug: ""),
        ShopsTiles(
            name: "Shop4",
            imageUrl: "ic_best_food_4",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
      ],
    );
  }
}
