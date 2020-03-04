import 'package:bookingbeauty/model/product.dart';
import 'package:bookingbeauty/ui/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:bookingbeauty/extension/utility.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatefulWidget {
  final bool isTitleLeft;
  final bool isExpanded;
  final Function onTap;
  final Product product;

  const ProductCard({this.isTitleLeft, this.isExpanded, this.onTap, this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.18,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Align(
                    alignment: widget.isTitleLeft ? Alignment.centerLeft : Alignment.centerRight,
                    child: Card(
                      elevation: 1,
                      color: widget.product.titleBackgroundColor.hexToColor(),
                      child: Container(
                        width: 150,
                        height: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              widget.product.mainTitle,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              widget.product.subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: !widget.isTitleLeft ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: FadeInImage(
                        image: NetworkImage(widget.product.backgroundImage ?? ""),
                        fadeInDuration: Duration(milliseconds: 200),
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: widget.onTap,
    );
  }
}
