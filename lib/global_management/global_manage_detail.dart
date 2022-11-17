import 'package:flutter/material.dart';

class GlobalDetail extends StatefulWidget {
  const GlobalDetail({super.key});

  @override
  State<GlobalDetail> createState() => _GlobalDetailState();
}

class _GlobalDetailState extends State<GlobalDetail> {
  int _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, GlobalNavigationModel<int>(_currentValue));
        },
        child: const Text("Save"),
      ),
      appBar: AppBar(title: Text(_currentValue.toString())),
      body: TextField(
        maxLength: 1,
        onChanged: (value) {
          final numberValue = int.tryParse(value);
          if (numberValue == null) return;
          setState(() {
            _currentValue = numberValue;
          });
        },
      ),
    );
  }
}

class GlobalNavigationModel<T> {
  final bool isComplete;
  final T data;

  GlobalNavigationModel(this.data, {this.isComplete = true});
}
