import 'package:flutter/material.dart';
import 'package:common/widgets/rounded_button.dart';

class WhatsNextScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WhatsNextScreenState();

}

class _WhatsNextScreenState extends State<WhatsNextScreen> {

  List<InstructionStep>steps=[];

  @override
  void initState() {
    super.initState();
    steps.add(InstructionStep(title: "Approval",description: "Some Description"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whats Next?"),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
          InstructionStep step=steps[index];
          return ExpansionTile(title: Text(step.title),children: <Widget>[
            Text(step.description)
          ],);
        },
        shrinkWrap: true,
        itemCount: steps.length,
      ),
      bottomNavigationBar: RoundedButton("Go Back",onPressed: (){
        Navigator.of(context).maybePop();
      },),
    );
  }

}
class InstructionStep{
  final String title;
  final String description;

  InstructionStep({this.title, this.description});
}