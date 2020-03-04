import 'package:bookingbeauty/model/salon_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalonService extends StatelessWidget {
  final SalonServiceModel salonServiceModel;

  SalonService(this.salonServiceModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text(
                  salonServiceModel.serviceName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                'form ${salonServiceModel.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                salonServiceModel.timeToFinish,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'Save ${salonServiceModel.discountText}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
