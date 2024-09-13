// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../data/datasources/lagu_remote_datasource.dart';
import '../home_page.dart';

class RemoveDialog extends StatelessWidget {
  final int laguId;
  const RemoveDialog({
    super.key,
    required this.laguId,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete"),
      content: const Text("Are you sure want to delete?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              LaguRemoteDatasource().deleteLaguDaerah(laguId);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
            },
            child: const Text("Delete"))
      ],
    );
  }
}
