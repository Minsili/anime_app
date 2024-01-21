import 'package:flutter/material.dart';

class ListAnime extends StatefulWidget {
  const ListAnime({super.key});

  @override
  State<ListAnime> createState() => _ListAnimeState();
}

class _ListAnimeState extends State<ListAnime> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  //funtion to add items in the list
  void _addItem(){
    _items.insert(0, "Items ${_items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(seconds: 1),
    );
  }

  //funtion to remove items in the list
  void _removeItem(int index){
    _key.currentState!.removeItem(
      index,
      (_, animation){
        return SizeTransition(
            sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.red,
            child: ListTile(
              title: Text(
                  "Deleted",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'List animation',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add_circle_outline_outlined)
          ),
          Expanded(
              child: AnimatedList(
                key: _key,
                  initialItemCount: 0,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index, animation){
                     return SizeTransition(
                     key: UniqueKey(),
                       sizeFactor: animation,
                       child: Card(
                         margin: const EdgeInsets.all(10),
                         color: Colors.blueAccent,
                         child: ListTile(
                           title: Text(
                             _items[index],
                             style: TextStyle(fontSize: 24),
                           ),
                           trailing: IconButton(
                             icon: const Icon(Icons.delete_forever_outlined),
                             onPressed: (){
                               _removeItem(index);
                             },
                           ),
                         ),
                       ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}

