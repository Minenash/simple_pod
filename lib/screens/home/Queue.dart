import 'package:flutter/material.dart';
import 'package:simple_pod/widgets/eText.dart';

class QueueScreen extends StatefulWidget {
  QueueScreen({Key key}) : super(key: key);

  @override
  _QueueScreenState createState() => _QueueScreenState();

  static Widget appbar() {
    return AppBar(
      title: Text("Queue"),
      leading: IconButton(
        icon: Icon(Icons.sort),
        onPressed: () {},
      ),
      actions: <Widget>[
      ],
    );
  }

}

class _QueueScreenState extends State<QueueScreen> {

  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: eText("Coming\nSoon", wrap: 2, align: TextAlign.center, size: 24, color: Colors.grey[200]),
      ),
    );
  }

}