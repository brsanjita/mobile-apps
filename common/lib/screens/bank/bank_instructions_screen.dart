import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class BankInstructionsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankInstructionsScreenState();
}

class _BankInstructionsScreenState extends State<BankInstructionsScreen> {
  List<Instruction> instructions = [
    Instruction(
        title: "Approval",
        description:
            "To ensure safety and quality of services provided through check the partners applications to meet our standards. This generally takes a minimum of 4 days to a week"),
    Instruction(
        title: "Verification",
        description:
        "To ensure safety and quality of services provided through check the partners applications to meet our standards. This generally takes a minimum of 4 days to a week"),
    Instruction(
        title: "Training",
        description:
        "To ensure safety and quality of services provided through check the partners applications to meet our standards. This generally takes a minimum of 4 days to a week"),
    Instruction(
        title: "Field Trial",
        description:
        "To ensure safety and quality of services provided through check the partners applications to meet our standards. This generally takes a minimum of 4 days to a week"),
    Instruction(
        title: "Lets make money baby!",
        description:
        "To ensure safety and quality of services provided through check the partners applications to meet our standards. This generally takes a minimum of 4 days to a week"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Whats Next?"),
      ),
      body: ListView.separated(
        separatorBuilder: (context,index)=>Divider(),
        itemBuilder: (context, index) => ExpansionTile(
              title: Text("Step ${index+1} (${instructions[index].title})",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,),),
              children: <Widget>[Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(instructions[index].description,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400,),),
              )],
            ),
        itemCount: instructions.length,
        shrinkWrap: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedButton("Go Back",color: Colors.black,onPressed: (){},),
      ),
    );
  }
}

class Instruction {
  final String title;
  final String description;

  Instruction({this.title, this.description});
}
