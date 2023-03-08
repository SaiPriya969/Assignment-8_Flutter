import 'package:flutter/material.dart';
import 'package:project8/screens/home_page.dart';

class Details extends StatefulWidget {
  info item;
  Details({super.key, required this.item});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
          child: Column(children: [
            Text(widget.item.country),
            Text(widget.item.capital),
            // Image(image: AssetImage(widget.item.flag)),
            Image(image: NetworkImage(widget.item.flag))
          ]),
        ));
  }
}
