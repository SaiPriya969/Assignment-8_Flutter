import 'package:flutter/material.dart';

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

class info {
  late String country;
  late String capital;
  late String flag;
  info(this.country, this.capital, this.flag);
}

List<info> list1 = [
  info("India", "delhi",
      "https://www.worldatlas.com/r/w425/img/flag/in-flag.jpg"),
  info("Bangladesh", "Dhaka",
      "https://www.worldatlas.com/r/w425/img/flag/bd-flag.jpg")
];
List<info> tempList = [];
void initState() {
  tempList = list1;
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Column(
        children: [
          TextField(
            controller: inputController,
            decoration: const InputDecoration(hintText: "Search countries"),
            onChanged: (value) {
              tempList.clear();
              setState(() {
                for (int i = 0; i < list1.length; i++) {
                  if (list1[i].capital.contains(value) ||
                      list1[i].country.contains(value)) {
                    tempList.add(list1[i]);
                  }
                }
              });
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tempList.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        child: Row(
                      children: [
                        Text(
                            "${tempList[index].country}-${tempList[index].capital}"),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/details',
                                  arguments: tempList[index]);
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
    );
  }
}
