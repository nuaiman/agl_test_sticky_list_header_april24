import 'package:flutter/material.dart';

import '../widget/tenth_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  bool _stickItem = false;

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent) {
      return;
    }
    if (_controller.offset >=
        _controller.position.viewportDimension - kToolbarHeight) {
      setState(() {
        _stickItem = true;
      });
    } else {
      setState(() {
        _stickItem = false;
      });
    }
  }

  @override
  void initState() {
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky List'),
      ),
      body: Column(
        children: [
          _stickItem ? const TenthItem() : const SizedBox.shrink(),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return Opacity(
                    opacity: _stickItem ? 0 : 1,
                    child: const TenthItem(),
                  );
                } else {
                  return Card(
                    child: ListTile(
                      leading: Text((index + 1).toString()),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
