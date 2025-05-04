import 'package:flutter/material.dart';
import '../data/questions_data.dart';

class CategoryScreen extends StatelessWidget {
  final categories = categorizedQuestions.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Category')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/quiz',
                arguments: categories[index],
              );
            },
          );
        },
      ),
    );
  }
}
