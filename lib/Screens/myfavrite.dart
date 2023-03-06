import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/Favourite_provider.dart';
class Myfavourite extends StatefulWidget {
  const Myfavourite({Key? key}) : super(key: key);

  @override
  State<Myfavourite> createState() => _MyfavouriteState();
}

class _MyfavouriteState extends State<Myfavourite> {

  @override
  Widget build(BuildContext context) {
    final itemprovider = Provider.of<FavouiteitemProvider>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("favourite items"),
        actions:  [
          Icon(Icons.favorite),
        ],
      ),
     body: Column(
        children: [
          Consumer<FavouiteitemProvider>(builder: (context, value, child) {
            return Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount:itemprovider.favriteitem.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (value.favriteitem.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additems(index);
                        }
                      },
                      title: Text('item' + index.toString()),
                      trailing: Icon(value.favriteitem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border),
                    );
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
