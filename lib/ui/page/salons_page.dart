import 'package:bookingbeauty/model/salon_info.dart';
import 'package:bookingbeauty/widget/salon_infromation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalonsPage extends StatefulWidget {
  @override
  _SalonsPageState createState() => _SalonsPageState();
}

class _SalonsPageState extends State<SalonsPage> {
  static List<SalonServiceModel> listOfSalonService = [
    SalonServiceModel('Signature Gel Manicure', '\$21', '25%', '45min'),
    SalonServiceModel('Express Gel Manicure with gel polish removal', '\$18.75', '25%', '40min'),
    SalonServiceModel('Signature Gel Manicure with gel polish removal', '\$24.75', '25%', '55min'),
  ];

  final List<SalonInfo> listOfSalonInfo = [
    SalonInfo(
      'Janea nail studio',
      '27-29 King Street West, Central Retail District, Manchester',
      4.5,
      38,
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0K6nGkSFf52n-RutHpfqTwOL8BY4dtp8lFRNhm3BJJgdeoIgX&s",
      listOfSalonService,
    ),
    SalonInfo(
      'Janea nail studio',
      '27-29 King Street West, Central Retail District, Manchester',
      4.5,
      38,
      "https://static.wixstatic.com/media/ae96f1_27de530542494ae793f9ad10ec6b3aae~mv2.png/v1/fill/w_618,h_334,al_c,q_85,usm_0.66_1.00_0.01/Paula's.webp",
      listOfSalonService,
    ),
    SalonInfo(
      'Janea nail studio',
      '27-29 King Street West, Central Retail District, Manchester',
      4.5,
      38,
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0K6nGkSFf52n-RutHpfqTwOL8BY4dtp8lFRNhm3BJJgdeoIgX&s",
      listOfSalonService,
    ),
    SalonInfo(
      'Janea nail studio',
      '27-29 King Street West, Central Retail District, Manchester',
      4.5,
      38,
      "https://static.wixstatic.com/media/ae96f1_27de530542494ae793f9ad10ec6b3aae~mv2.png/v1/fill/w_618,h_334,al_c,q_85,usm_0.66_1.00_0.01/Paula's.webp",
      listOfSalonService,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkResponse(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Theme.of(context).primaryColor,
                          size: 35,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            categorySearch(),
                            SizedBox(height: 5),
                            locationSearch(),
                            SizedBox(height: 5),
                            appointmentDateSelection()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                filterSection(),
                listOfSalonInformation()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget filterSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.filter_list,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 4),
              Text(
                'Filter by price, rating...',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.map,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 4),
              Text(
                'Map',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categorySearch() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFF4F3F3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            enabled: false,
            style: TextStyle(fontSize: 14.0),
            autofocus: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 12),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  size: 22,
                  color: Colors.black45,
                ),
                hintText: 'Search',
                labelText: 'Gel Nail Manicure'),
          ),
        ],
      ),
    );
  }

  Widget locationSearch() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFF4F3F3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            enabled: false,
            style: TextStyle(fontSize: 14.0),
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 12),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.location_on,
                size: 22,
                color: Colors.black45,
              ),
              hintText: 'Location Search',
              labelText: 'UK',
            ),
          ),
        ],
      ),
    );
  }

  Widget appointmentDateSelection() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Color(0xFFF4F3F3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: <Widget>[
          TextField(
            enabled: false,
            style: TextStyle(fontSize: 14.0),
            autofocus: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 12),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.calendar_today,
                size: 22,
                color: Colors.black45,
              ),
              hintText: 'Any Date',
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfSalonInformation() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listOfSalonInfo.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return InkResponse(
          onTap: () {},
          child: SalonInformation(listOfSalonInfo[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
    );
  }
}
