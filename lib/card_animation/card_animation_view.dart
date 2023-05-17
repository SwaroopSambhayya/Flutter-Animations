import 'package:card_animation/card_animation/components/creditcard.dart';
import 'package:flutter/material.dart';

class CardAnimationView extends StatefulWidget {
  const CardAnimationView({super.key});

  @override
  State<CardAnimationView> createState() => _CardAnimationViewState();
}

class _CardAnimationViewState extends State<CardAnimationView>
    with TickerProviderStateMixin {
  late ScrollController scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        setState(() {
          scrollOffset = scrollController.offset;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Card Animation",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.5,
      ),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return CreditCard(index: index, y: scrollController.offset);
        },
        itemCount: 6,
      ),
    );
  }
}
