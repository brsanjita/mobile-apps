import 'package:customer/models/personal_service/personal_service.dart';
import 'package:flutter/material.dart';

class PersonalServiceWidget extends StatefulWidget {
  final PersonalServiceProvider homeService;
  final Function(bool) onSelected;
  const PersonalServiceWidget({Key key, @required this.homeService,@required this.onSelected})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalServiceWidgetState();
}

class _PersonalServiceWidgetState extends State<PersonalServiceWidget> {
  bool selected=false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        setState(() {
          selected=!selected;
          widget.onSelected(selected);
        });
      },
      leading: Icon(Icons.work),
      title: Text(widget.homeService.title),
      trailing: Checkbox(value: selected, onChanged: (val){
        setState(() {
          selected=val;
          widget.onSelected(selected);
        });
      }),
    );
  }
}
