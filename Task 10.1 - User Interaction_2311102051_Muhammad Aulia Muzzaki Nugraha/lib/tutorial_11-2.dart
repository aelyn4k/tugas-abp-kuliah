import 'package:flutter/material.dart';

class Tutorial112Page extends StatefulWidget {
  const Tutorial112Page({super.key});

  @override
  State<Tutorial112Page> createState() => _Tutorial112PageState();
}

class _Tutorial112PageState extends State<Tutorial112Page> {
  final List<Map<String, dynamic>> data = [
    {
      "title": "Native App",
      "platform": "Android, iOS",
      "lang": "Java, Kotlin, Swift, C#",
      "color": Colors.red,
    },
    {
      "title": "Hybrid App",
      "platform": "Android, iOS, Web",
      "lang": "JavaScript, Dart",
      "color": Colors.grey,
    }
  ];

  final TextEditingController titleInput = TextEditingController();
  final TextEditingController platInput = TextEditingController();
  final TextEditingController langInput = TextEditingController();

  final List<String> colors = ['blue', 'green', 'yellow'];
  String? colSelected;

  Color getSelectedColor(String? value) {
    switch (value) {
      case 'green':
        return Colors.green;
      case 'yellow':
        return Colors.yellow;
      case 'blue':
      default:
        return Colors.blue;
    }
  }

  @override
  void dispose() {
    titleInput.dispose();
    platInput.dispose();
    langInput.dispose();
    super.dispose();
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Tech'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleInput,
                  decoration: const InputDecoration(
                    labelText: 'Tech Name',
                  ),
                ),
                TextField(
                  controller: platInput,
                  decoration: const InputDecoration(
                    labelText: 'Platform',
                  ),
                ),
                TextField(
                  controller: langInput,
                  decoration: const InputDecoration(
                    labelText: 'Language',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: colSelected,
                  items: colors
                      .map(
                        (col) => DropdownMenuItem<String>(
                      value: col,
                      child: Text(col),
                    ),
                  )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      colSelected = val;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Color',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (titleInput.text.isEmpty ||
                    platInput.text.isEmpty ||
                    langInput.text.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                setState(() {
                  data.add({
                    'title': titleInput.text,
                    'platform': platInput.text,
                    'lang': langInput.text,
                    'color': getSelectedColor(colSelected),
                  });
                });

                titleInput.clear();
                platInput.clear();
                langInput.clear();
                colSelected = null;

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void showDetailDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(data[index]['title']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data[index]['platform']),
              Text(data[index]['lang']),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: data[index]['color'] as Color,
              ),
              title: Text(data[index]['title'] as String),
              subtitle: Text(data[index]['platform'] as String),
              onTap: () => showDetailDialog(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}