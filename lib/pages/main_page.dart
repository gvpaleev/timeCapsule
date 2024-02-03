import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('sss')),
      ),
      body: Container(child: Center(child: FindListWidget())),
    );
  }
}

class FindListWidget extends StatefulWidget {
  const FindListWidget({super.key});

  @override
  State<FindListWidget> createState() => FfindLisWidgettState();
}

class FfindLisWidgettState extends State<FindListWidget> {
  // DropdownMenuItem<String> s = ['s'] as DropdownMenuItem<String>;

  @override
  Widget build(BuildContext context) {
    return SearchChoices.single(
      items: const [
        DropdownMenuItem(
          value: "one item",
          child: Text("one item"),
        )
      ],
      // value: selectedValueSingleMenu,
      hint: "Select one",
      searchHint: null,
      onChanged: (value) {
        setState(() {
          print(value);
          // selectedValueSingleMenu = value;
        });
      },
      dialogBox: false,
      isExpanded: true,
      // menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
    );
  }
}
