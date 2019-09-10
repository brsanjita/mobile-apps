import 'package:flutter/material.dart';

class LinearLoader extends StatefulWidget {
  final double height;

  const LinearLoader({Key key, this.height=2.0}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LinearLoaderState();

}

class _LinearLoaderState extends State<LinearLoader> with TickerProviderStateMixin<LinearLoader>{

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    controller.repeat(max: 1.0,min: 0.0,reverse: true,period: Duration(seconds: 1));
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        double width=constraints.maxWidth;
        return AnimatedBuilder(
          animation: controller,
          builder: (context,child){
            return Container(
              width: width,
              alignment: Alignment.center,
              child: Container(width:width*controller.value,height: widget.height,color: Colors.black,),
            );
          },
          child: Container(
            width: 0.0,
            height: 0.0,
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}