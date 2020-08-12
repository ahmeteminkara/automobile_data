import 'package:flutter/material.dart';

class MyBottomSheet {
  static show(BuildContext ctx, List<Widget> items) {
    return showModalBottomSheet(
      context: ctx,
      builder: (_) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) => items.elementAt(index),
      ),
    );
  }
}
