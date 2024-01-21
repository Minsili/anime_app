import 'package:flutter/material.dart';

class ListAnime extends StatefulWidget {
  const ListAnime({Key? key});

  @override
  State<ListAnime> createState() => _ListAnimeState();
}

class _ListAnimeState extends State<ListAnime> {
  final _items = <String>[];
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _addItem() {
    final newItem = _textEditingController.text;
    if (newItem.isNotEmpty) {
      _items.insert(0, newItem);
      _key.currentState!.insertItem(
        0,
        duration: const Duration(seconds: 1),
      );
      _textEditingController.clear();
    }
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
          (_, animation) {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'List animation',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _addItem,
                icon: const Icon(Icons.add_circle_outline_outlined),
              ),
            ],
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key: UniqueKey(),
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.blueAccent,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_forever_outlined),
                        onPressed: () {
                          _removeItem(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}