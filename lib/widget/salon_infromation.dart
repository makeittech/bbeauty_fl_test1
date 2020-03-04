import 'package:bookingbeauty/model/salon_info.dart';
import 'package:bookingbeauty/ui/page/salons_page.dart';
import 'package:bookingbeauty/widget/salon_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class SalonInformation extends StatelessWidget {
  final SalonInfo salonInfo;

  SalonInformation(this.salonInfo);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.grey.withOpacity(0.3),
            height: 120,
            child: FadeInImage(
              height: 120,
              width: MediaQuery.of(context).size.width,
              image: NetworkImage(salonInfo.salonImageUrl),
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  salonInfo.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  salonInfo.location,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      salonInfo.rating.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFD0C785)
                      ),
                    ),
                    RatingBar(
                      itemSize: 14,
                      ignoreGestures: true,
                      initialRating: salonInfo.rating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Color(0xFFD0C785),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(width: 14),
                    Text(
                      '${salonInfo.numberOfReviews} reviews',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18),
                listOfSalonService(salonInfo.listOfSalonService),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    'Show all services...',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listOfSalonService(List<SalonServiceModel> listOfSalonService) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listOfSalonService.length,
      itemBuilder: (BuildContext buildContext, int index) {
        return InkResponse(
          onTap: () {},
          child: SalonService(listOfSalonService[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 14),
    );
  }
}
