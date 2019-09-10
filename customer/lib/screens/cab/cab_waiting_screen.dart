import 'package:common/widgets/rounded_button.dart';
import 'package:customer/screens/cab/cab_arriving_screen.dart';
import 'package:flutter/material.dart';
import 'package:common/widgets/radial_seek_bar.dart';

class CabWaitingScreen extends StatefulWidget {
  final String from,to;

  const CabWaitingScreen({Key key, this.from, this.to}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CabWaitingScreenState();
}

class _CabWaitingScreenState extends State<CabWaitingScreen>
    with TickerProviderStateMixin<CabWaitingScreen> {
  AnimationController controller;

  static const double TOTAL_SECS = 40;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 40,
        ),
        value: 1.0);
    controller.reverse();
    controller.addListener((){
      if(controller.value<=0.9){
        controller.stop(canceled: false);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CabArrivingScreen(from: widget.from,to: widget.to,)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Customer App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildHeader(),
                buildLocation("Sender Location",
                    widget.from),
                SizedBox(
                  height: 12.0,
                ),
                _buildTimer(),
                SizedBox(
                  height: 12.0,
                ),
                buildLocation("Reciever Location",
                    widget.to),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: RoundedButton(
              "Cancel",
              onPressed: () {},
              color: Colors.red,
            )),

          ],
        ),
      ),
    );
  }

  String get counter {
    double val = controller.value * TOTAL_SECS;
    Duration duration = Duration(seconds: val.toInt());
    return "${getFormatted(duration.inMinutes)}:${getFormatted(duration.inSeconds)}";
  }

  String getFormatted(int number) {
    return number < 10 ? "0$number" : "$number";
  }

  Widget _buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Requesting Taxi",
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w300, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => RadialSeekBar(
          child: Padding(
            padding: const EdgeInsets.all(64.0),
            child: Text(
              counter,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
            ),
          ),
          progressColor: Colors.green,
          progressWidth: 10.0,
          progressPercent: controller.value,
          trackColor: Color(0xffeeeeee),
          trackWidth: 9.0,
        ),
        child: Container(
          width: 0.0,
          height: 0.0,
        ),
      ),
    );
  }

  Widget buildLocation(String label, String address) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 12.0,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          address,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
