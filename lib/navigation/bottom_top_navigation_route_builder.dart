import 'package:flutter/material.dart';

class BottomTopNavigationRouteBuilder extends PageRouteBuilder {
  final Widget page;

  BottomTopNavigationRouteBuilder({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          opaque: false,
          transitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
                reverseCurve: Curves.easeOut,
              ),
            ),
            child: child,
          ),
        );
}
