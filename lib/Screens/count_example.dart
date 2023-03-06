import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/count_provider.dart';
import 'package:provider_statemanag/Provider/provider_Exampleone.dart';

class Count_Example extends StatefulWidget {
  const Count_Example({Key? key}) : super(key: key);

  @override
  State<Count_Example> createState() => _Count_ExampleState();
}

class _Count_ExampleState extends State<Count_Example> {
  double value = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<Counter_Provider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      Text(countProvider.count.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    //final provider = Provider.of<Example_oneProvider>(context, listen: false);
    final countProvider = Provider.of<Counter_Provider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('count example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<Counter_Provider>(builder: (context, valua, child) {
              return Text(
                countProvider.count.toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              );
            }),
          ),
          Consumer<Example_oneProvider>(builder: (context,value,child){
             return    Slider(
                 min: 0,
                 max: 1,
                 value: value.values,
                 onChanged: (val) {
                   value.setvalue(val);
                 });
          }),

          Consumer<Example_oneProvider>(builder: (context,value,child)
          {

            return  Row(
                children: [
                  Expanded(
                    child:Container(
                      height: 100,
                      color: Colors.blue.withOpacity(value.values),
                    ),

                  ),
                  Expanded(
                    child:Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.values),
                    ),
                  )
                ]
            );
          })


            ],
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
