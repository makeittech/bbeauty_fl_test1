import 'package:bookingbeauty/model/product.dart';
import 'package:bookingbeauty/navigation/bottom_top_navigation_route_builder.dart';
import 'package:bookingbeauty/ui/page/salons_page.dart';
import 'package:bookingbeauty/widget/expand_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<SubProduct> listOfSubProductCut = [
    SubProduct('wash'),
    SubProduct('wash & cut'),
    SubProduct('wash & treat'),
    SubProduct('wash & treat & cut'),
    SubProduct('HairCut'),
  ];

  static List<SubProduct> listOfSubProductFresh = [
    SubProduct('Feel Fresh'),
    SubProduct('Body Massage'),
    SubProduct('Feel Fresh'),
    SubProduct('Body Massage'),
    SubProduct('Feel Fresh'),
    SubProduct('Body Massage'),
  ];

  final List<Product> listOfProduct = [
    Product('Fresh Cut', 'Looks Great', 'https://n4.sdlcdn.com/imgs/i/o/d/Transparent-PVC-Haircut-Comb-Antistatic-SDL901266726-1-38311.jpg', "#FF6B6C", listOfSubProductCut),
    Product('Feel Fresh', 'Relax', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHG05sm6rnzFN4vF8aXy5QCaIt8hjW1zeFemwnQbJQiwVXGK2Pig&s', "#DD702C", listOfSubProductFresh),
    Product('Fresh Cut', 'Looks Great', 'https://n4.sdlcdn.com/imgs/i/o/d/Transparent-PVC-Haircut-Comb-Antistatic-SDL901266726-1-38311.jpg', "#7A83FB", listOfSubProductCut),
    Product('Fresh Cut', 'Looks Great', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHG05sm6rnzFN4vF8aXy5QCaIt8hjW1zeFemwnQbJQiwVXGK2Pig&s', "#3A3A3A", listOfSubProductCut),
    Product('Fresh Cut', 'Looks Great', 'https://n4.sdlcdn.com/imgs/i/o/d/Transparent-PVC-Haircut-Comb-Antistatic-SDL901266726-1-38311.jpg', "#7A83FB", listOfSubProductCut),
    Product('Fresh Cut', 'Looks Great', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHG05sm6rnzFN4vF8aXy5QCaIt8hjW1zeFemwnQbJQiwVXGK2Pig&s', "#3A3A3A", listOfSubProductCut),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: _getListOfProduct(),
        ),
      ),
    );
  }

  Widget _getListOfProduct() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 14),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: listOfProduct.length,
          itemBuilder: (BuildContext buildContext, int index) {
            return ExpandCardWidget(
              product: listOfProduct[index],
              child: _productSubCategory(listOfProduct[index].listOfSubProduct),
              isTitleLeft: index % 2 == 0,
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
        ),
      ],
    );
  }

  Widget _productSubCategory(List<SubProduct> listOfSubProduct) {
    return Container(
      color: Color(0xFFDBDADB),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfSubProduct.length,
        itemBuilder: (BuildContext buildContext, int index) {
          return InkResponse(
            onTap: () {
              navigateToSalonsPage();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                listOfSubProduct[index].name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 4),
      ),
    );
  }

  void navigateToSalonsPage() {
    Navigator.push(
      context,
      BottomTopNavigationRouteBuilder(page: SalonsPage()),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
