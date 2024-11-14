import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String payload;
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_payload.toString().split('|')[0]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Column(children: [
              SizedBox(height: 10),
              Text('Hallo Hassan'),
              SizedBox(height: 10),
              Text('you have new reminder')
            ]),
            const SizedBox(height: 10),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              margin: const EdgeInsets.only(left: 30, right: 30),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Column(children: [
                  const Row(
                    children: [
                      Icon(Icons.text_format),
                      SizedBox(width: 10),
                      Text('Title'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(_payload.toString().split('|')[0]),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.description),
                      SizedBox(width: 10),
                      Text('Description'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _payload.toString().split('|')[1],
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(Icons.description),
                      SizedBox(width: 10),
                      Text('Date'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _payload.toString().split('|')[2],
                    textAlign: TextAlign.justify,
                  ),
                ]),
              ),
            )),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
