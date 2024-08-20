import 'package:bg_fly/Controllers/removebg_controller.dart';
import 'package:bg_fly/Views/BgRemoved/Widgets/error.dart';
import 'package:bg_fly/Views/BgRemoved/Widgets/removing_background.dart';
import 'package:bg_fly/Views/BgRemoved/Widgets/results.dart';
import 'package:bg_fly/Views/layout.dart';
import 'package:bg_fly/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BgRemoved extends StatefulWidget {
  const BgRemoved({super.key});

  @override
  State<BgRemoved> createState() => _BgRemovedState();
}

class _BgRemovedState extends State<BgRemoved> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller =
          Provider.of<RemoveBgController>(context, listen: false);
      controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: const Layout(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              BaseWidget(),
            ],
          ),
        ));
  }
}

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RemoveBgController>(context);
    late Widget widget;
    switch (controller.currentState) {
      case BgControllerState.removed:
        widget = const Results();
        break;
      case BgControllerState.error:
        widget = const RemovingError();
        break;
      default:
        widget = const RemovingBackground();
    }
    return widget;
  }
}
