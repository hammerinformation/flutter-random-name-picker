import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Github : @hammerinformation
void main() {
  runApp(MaterialApp(
    home: RandomNamePicker(),
    debugShowCheckedModeBanner: false,
  ));
}

class RandomNamePicker extends StatefulWidget {
  RandomNamePicker({Key key}) : super(key: key);

  @override
  _RandomNamePickerState createState() => _RandomNamePickerState();
}

class _RandomNamePickerState extends State<RandomNamePicker> {
  var myList = List<String>();
  var textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: CupertinoTextField(
                controller: textEditingController,
                maxLines: 20,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(0),
                    child: Text("Random"),
                    onPressed: () {
                      myList = textEditingController.text.split(',');

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Show(myList)),
                      );
                    },
                    color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Show extends StatefulWidget {
  var myList = List<String>();

  Show(List<String> list) {
    this.myList = list;
    myList.shuffle();
  }
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: widget.myList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(2, 4, 2, 4),
            shadowColor: Colors.blue,
            child: ListTile(
              leading: Text((index + 1).toString()),
              title: Center(
                child: Text(widget.myList[index]),
              ),
            ),
          );
        },
      ),
    ));
  }
}
