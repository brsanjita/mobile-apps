import 'package:common/screens/wallet/payment_screen.dart';
import 'package:common/screens/wallet/payments_screen.dart';
import 'package:common/widgets/ease_in_widget.dart';
import 'package:common/widgets/rounded_button.dart';
import 'package:customer/widgets/personal_service/duration_selection_screen.dart';
import 'package:flutter/material.dart';

class BookingDateSelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingDateSelectionScreenState();
}

class _BookingDateSelectionScreenState
    extends State<BookingDateSelectionScreen> {
  int selected = 0;
  PageController controller;
  ScrollController listController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      if (controller.page.toInt() != selected) {
        setState(() {
          this.selected = controller.page.toInt();
        });
        listController.animateTo((selected - 1) * 100.0,
            duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      }
    });
  }

  String timings = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Booking Date"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 80.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                controller: listController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  DateTime current = DateTime.now().add(Duration(days: index));
                  return EaseInWidget(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                      controller.animateToPage(index,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.all(4.0),
                      color:
                          selected == index ? Colors.deepOrange : Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              days[(current.weekday - 1) % 7],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              "${current.day} ${months[current.month - 1]}",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: PageView.builder(
                controller: controller,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return DurationSelectionScreen(
                    onSelected: (timings) {
                      setState(() {
                        this.timings = timings;
                      });
                    },
                    selectedTimings: timings,
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: RoundedButton("Continue", onPressed: () async{
       await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentMethodsScreen(amount: 50.0,)));
       Navigator.of(context).pushNamed('/bookSuccess');
       }, color: Colors.black),
    );
  }

  List<String> get months => [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'June',
        'July',
        'Aug',
        'Sept',
        'Oct',
        'Nov',
        'Dec'
      ];

  List<String> get days => ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
}
