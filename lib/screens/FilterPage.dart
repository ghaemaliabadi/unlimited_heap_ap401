import 'dart:collection';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterPage extends StatefulWidget {
  HashSet<String>? tags;
  HashSet<String>? companies;
  FilterPage({super.key, this.tags, this.companies});
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.5,
        title: Text('test',
            style: Theme.of(context).textTheme.displayMedium),
      ),
      body: Column (
        children: [
          // print companies
          Text(widget.companies.toString()),
          // print tags
          Text(widget.tags.toString()),
        ],
      )
    );
  }
}