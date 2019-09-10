import 'package:customer/models/common_delivery/delivery_method.dart';
import 'package:customer/utils/common_delivery_controller.dart';
import 'package:customer/widgets/common_delivery/delivery_widget.dart';
import 'package:flutter/material.dart';

class CommonDeliveryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CommonDeliveryScreenState();
}

class _CommonDeliveryScreenState extends State<CommonDeliveryScreen> {
  List<DeliveryMethod> methods = [];
  bool isLoading;

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() async {
    isLoading = true;
    List<DeliveryMethod> methods = await CommonDeliveryController.getMethods();
    if (mounted) {
      setState(() {
        this.methods = methods;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Common Delivery"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => DeliveryWidget(
          delivery: methods[index],
        ),
        itemCount: methods.length,
        shrinkWrap: true,
      ),
    );
  }
}
