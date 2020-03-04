import 'package:bookingbeauty/model/product.dart';
import 'package:bookingbeauty/ui/page/home_page.dart';
import 'package:bookingbeauty/widget/product_card.dart';
import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 300);

class ExpandCardWidget extends StatefulWidget {
  final Duration animationDuration;
  final Widget child;
  final Product product;
  final bool isTitleLeft;

  ExpandCardWidget({Key key, this.animationDuration = _kExpand, this.child, this.product, this.isTitleLeft}) : super(key: key);

  @override
  _ExpandCardWidgetState createState() => _ExpandCardWidgetState();
}

class _ExpandCardWidgetState extends State<ExpandCardWidget> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeInOutCubic);

  AnimationController _controller;

  Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _heightFactor = _controller.drive(_easeInTween);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProductCard(
          isTitleLeft: widget.isTitleLeft,
          isExpanded: _isExpanded,
          onTap: _handleTap,
          product: widget.product,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: AnimatedBuilder(
            animation: _controller.view,
            builder: _buildChild,
            child: widget.child,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  Widget _buildChild(BuildContext context, Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }
}
