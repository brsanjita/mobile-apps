import 'package:common/widgets/rounded_button.dart';
import 'package:customer/models/personal_service/book_service.dart';
import 'package:flutter/material.dart';

class SpecialInstructionScreen extends StatefulWidget {
  final BookService bookService;

  const SpecialInstructionScreen({Key key, @required this.bookService})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SpecialInstructionScreenState();
}

class _SpecialInstructionScreenState extends State<SpecialInstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${widget.bookService.title}",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Add Special Instruction for provider below.",
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    maxLines: 4,
                    minLines: 4,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black54,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(4.0))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Service Charge",
                          style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0),
                        ),
                        Text(
                          "\$${widget.bookService.price}",
                          style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18.0),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          RoundedButton(
            "Add Item",
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
