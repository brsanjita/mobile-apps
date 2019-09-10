import 'package:flutter/material.dart';

class PinnedModalSheet extends StatefulWidget {
  final Function onExpanded;
  final bool initialExpanded;
  final double height;
  final Widget child;
  final double headerHeight;
  PinnedModalSheet(
  {@required this.onExpanded,
      this.initialExpanded = false,
      @required this.height, this.child, this.headerHeight});


  @override
  State<StatefulWidget> createState() => _PinnedModalSheetState();
}

class _PinnedModalSheetState extends State<PinnedModalSheet>
    with SingleTickerProviderStateMixin<PinnedModalSheet> {
  AnimationController _controller;
  double _kMinFlingVelocity = 700.0;
  double _kCloseProgressThreshold = 0.5;
  bool expanded = false;
  @override
  void initState() {
    super.initState();
    _controller = BottomSheet.createAnimationController(this);
    _controller.addListener(() {
      if (_controller.value > _kCloseProgressThreshold && !expanded) {
        expanded = true;
        widget.onExpanded();
      }
      if (_controller.value <= _kCloseProgressThreshold && expanded) {
        expanded = false;
//        widget.bottomSheet.onClosing();
      }
    });

    _controller.forward();
  }


  bool get _dismissUnderway => _controller.status == AnimationStatus.reverse;
  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;
    if (details.velocity.pixelsPerSecond.dy > _kMinFlingVelocity) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / widget.height;
      if (_controller.value > 0.0) _controller.fling(velocity: flingVelocity);
      if (flingVelocity < 0.0) close();
    } else if (_controller.value < _kCloseProgressThreshold) {
      if (_controller.value > 0.0) _controller.fling(velocity: -1.0);
      close();
    } else {
      _controller.animateTo(1.0,duration: Duration(milliseconds: 400,),curve: Curves.easeIn);
    }
  }

  void _handleDragUpdate(DragUpdateDetails details) {
//    if (_dismissUnderway)
//      return;
    print("Delta ${details.primaryDelta}");

    _controller.value -=
        details.primaryDelta / ((widget.height-widget.headerHeight) ?? details.primaryDelta);
  }
  void close() {
    _controller.animateTo(closeValue,duration: Duration(milliseconds: 500),curve: Curves.easeIn);
    expanded = false;
//    widget.bottomSheet.onClosing();
  }
  double get closeValue=>widget.headerHeight/widget.height;
  double childHeight=0.0;

  @override
  Widget build(BuildContext context) {
//    Widget pinned = ;
    Widget body = LayoutBuilder(
      builder: (context,constraints){
        double height=constraints.maxHeight;
        double width=constraints.maxWidth;
        print("Layout Height $height");
        return SingleChildScrollView(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return GestureDetector(
                onVerticalDragEnd: _handleDragEnd,
                onVerticalDragUpdate: _handleDragUpdate,
                child: Container(
                  margin: EdgeInsets.only(bottom: 24.0*(1-_controller.value)),
                  height: (_controller.value*(height)),
                  width: (width*4/5)+(width/5*_controller.value),
                  child: SingleChildScrollView(child: widget.child,physics: _controller.value<=closeValue?NeverScrollableScrollPhysics():BouncingScrollPhysics(),),
                ),
              );
            },
            child: Container(
              width: 0.0,
              height: 0.0,
            ),
          ),
        );
      },
    );
    return body;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
