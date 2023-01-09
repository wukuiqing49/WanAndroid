import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  State<FindPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("发现"),);
  }
}
