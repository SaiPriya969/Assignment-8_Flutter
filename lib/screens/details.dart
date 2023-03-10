import 'package:flutter/material.dart';
import 'package:project8/screens/home_page.dart';
import 'package:project8/providers/listProvider.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  int index;
  int id;
  Details({super.key, required this.index, required this.id});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  updateProvider updateObject1 = updateProvider();
  TextEditingController countryController = TextEditingController();
  TextEditingController capitalController = TextEditingController();

  // void updateText(int index) {
  //   setState(() {
  //     countryController.text = updateObject1.list1[index].country;
  //     capitalController.text = updateObject1.list1[index].capital;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    setState(() {
      for (int i = 0; i < updateObject1.list1.length; i++) {
        if (updateObject1.list1[i].id == widget.id) {
          widget.index = i;
        }
      }
      countryController.text = updateObject1.list1[widget.index].country;

      capitalController.text = updateObject1.list1[widget.index].capital;
    });

    // updateObject1.countryController.text =
    //     updateObject1.list1[widget.index].country;
    // updateObject1.capitalController.text =
    //     updateObject1.list1[widget.index].capital;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController.dispose();
    capitalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<updateProvider>(
      builder: (BuildContext context, updateObject, Widget? child) => Scaffold(
          appBar: AppBar(
            title: Text("Details"),
          ),
          body: Center(
            child: Column(children: [
              Text(updateObject.list1[widget.index].country),
              Text(updateObject.list1[widget.index].capital),
              // Text(widget.tempList.country),
              // Text(widget.tempList.capital),
              // Image(image: AssetImage(widget.item.flag)),
              Image(image: NetworkImage(updateObject.list1[widget.index].flag)),
              // Image(image: NetworkImage(widget.tempList.flag)),
              ElevatedButton(
                  onPressed: () => displayDialog(
                      updateObject.list1[widget.index].country,
                      updateObject.list1[widget.index].capital),
                  child: Text("Edit"))
            ]),
          )),
    );
  }

  displayDialog(String country, String capital) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer<updateProvider>(
          builder: (BuildContext context, providerInstance, Widget? child) =>
              AlertDialog(
            title: const Text("UPDATE"),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                controller: countryController,
              ),
              TextField(
                controller: capitalController,
              )
            ]),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    providerInstance.update(widget.index,
                        countryController.text, capitalController.text);
                    Navigator.pop(context);
                  },
                  child: const Text("UPDATE")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("CANCEL"))
            ],
          ),
        );
      },
    );
  }
}
