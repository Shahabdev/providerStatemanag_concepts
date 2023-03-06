import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/Favourite_provider.dart';
import 'myfavrite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    //final itemprovider = Provider.of<FavouiteitemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("favourite items"),
        actions:  [
          InkWell(
              onTap: ()  {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>Myfavourite()));
          },
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Column(
        children: [
          Consumer<FavouiteitemProvider>(builder: (context, value, child) {
            return Expanded(
              child: Card(
                child: ListView.builder(
                  itemCount: 50,
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
