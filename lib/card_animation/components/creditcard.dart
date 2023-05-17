import 'package:card_animation/card_animation/constants.dart';
import 'package:card_animation/card_animation/utils.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  final int index;
  final double y;

  const CreditCard({super.key, required this.index, required this.y});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.8;
    double cardHeight = (cardWidth * ratio) + cardMargin;
    double height = MediaQuery.of(context).size.height - 64;
    double position = (widget.index) * cardHeight - widget.y;
    double isDisappearing = -cardHeight;
    double isTop = 0;
    double isBottom = height - cardHeight;
    double isAppearing = height;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Transform.translate(
        offset: Offset(
          0,
          getInterPolateY(widget.y, widget.index, cardHeight, position,
              isBottom, isAppearing),
        ),
        child: Center(
          child: Transform.scale(
            scale: getAnimatedScale(
                position, isDisappearing, isTop, isBottom, isAppearing),
            child: Opacity(
              opacity: getAnimatedOpacity(
                  position, isDisappearing, isTop, isBottom, isAppearing),
              child: Image.asset(
                'assets/card${widget.index + 1}.png',
                width: cardWidth,
                height: cardWidth * ratio,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
