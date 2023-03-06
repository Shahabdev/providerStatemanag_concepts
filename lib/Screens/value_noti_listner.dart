import 'package:flutter/material.dart';

class ListnerNotifier extends StatelessWidget {
  ListnerNotifier({Key? key}) : super(key: key);
  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) => TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'Passward',
                      suffixIcon: InkWell(
                          onTap: (){
                            toggle.value=!toggle.value;
                          },
                          child: Icon(toggle.value?Icons.visibility_off_outlined:Icons.visibility))
                    ),
                  )),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _count,
                builder: (context, value, child) => Text(
                      _count.value.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
          print(_count.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
