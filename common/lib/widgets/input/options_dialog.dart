import 'package:flutter/material.dart';

class OptionsDialog extends StatelessWidget {
  final String title;
  final List<String> options;
  final Function(String) onSelected;
  const OptionsDialog(
      {Key key,
      @required this.title,
      @required this.options,
      @required this.onSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 3 / 4,
        child: ListView.builder(
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onSelected(options[index]);
                  Navigator.of(context).pop();
                },
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                    child: Text(options[index])),
              ),
          shrinkWrap: true,
          itemCount: options.length,
        ),
      ),
    );
  }
}
