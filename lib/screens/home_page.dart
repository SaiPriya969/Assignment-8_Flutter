import 'package:flutter/material.dart';
import 'package:project8/main.dart';
import 'package:project8/providers/listProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  var title;
  MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// List<List> list = [
//   ["India", "Delhi"],
//   ["India", "Delhi"]
// ];

// class info {
//   late String country;
//   late String capital;
//   late String flag;
//   info(this.country, this.capital, this.flag);
// }

// List<info> list1 = [
//   info("India", "delhi",
//       "https://www.worldatlas.com/r/w425/img/flag/in-flag.jpg"),
//   info("Bangladesh", "Dhaka",
//       "https://www.worldatlas.com/r/w425/img/flag/bd-flag.jpg")
// ];
updateProvider updateObject = updateProvider();
// List<info> tempList = updateObject.list1;

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   List<info> tempList = updateObject.list1;
  // }

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<updateProvider>(
      builder: (BuildContext context, updateObject, Widget? child) => Scaffold(
        appBar: AppBar(
          title: Text("${widget.title}"),
        ),
        body: Column(
          children: [
            TextField(
              controller: inputController,
              decoration: const InputDecoration(hintText: "Search countries"),
              onChanged: (value) {
                List<info> dummy = [];
                setState(() {
                  for (int i = 0; i < updateObject.list1.length; i++) {
                    if (updateObject.list1[i].capital.contains(value) ||
                        updateObject.list1[i].country.contains(value)) {
                      dummy.add(updateObject.list1[i]);
                    }
                  }
                  updateObject.tempList = dummy;
                });
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: updateObject.tempList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                          child: Row(
                        children: [
                          Text(
                              "${updateObject.tempList[index].country}-${updateObject.tempList[index].capital}"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/details',
                                    arguments: dataInterface(index,
                                        updateObject.tempList[index].id));
                              },
                              child: Text("Details"))
                        ],
                      )),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
