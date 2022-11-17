import 'package:bloc_state/global_management/global_model.dart';
import 'package:flutter/material.dart';

import 'global_manage_detail.dart';

class GlobalManageView extends StatefulWidget {
  const GlobalManageView({super.key});

  @override
  State<GlobalManageView> createState() => _GlobalManageViewState();
}

class _GlobalManageViewState extends State<GlobalManageView> {
  late List<GlobalModel> globalItems = [];

  @override
  void initState() {
    super.initState();
    globalItems = GlobalModel.mockItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: GlobalModel.mockItems.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () async {
                final result = await Navigator.of(context)
                    .push<GlobalNavigationModel<int>>(MaterialPageRoute(
                        builder: (context) => const GlobalDetail()));
                if (result != null || (result?.isComplete ?? false)) {
                  if(!mounted) return;
                  setState(() {
                    globalItems = GlobalModel.mockItems
                        .where((element) => element.value <= result!.data)
                        .toList();
                  });
                }
              },
              title: Text(GlobalModel.mockItems[index].title),
            ),
          ),
        ));
  }
}
