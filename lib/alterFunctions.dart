import 'package:flutter/material.dart';

actions(BuildContext context, String name, type) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          title: Text(
            'You ${type} ${name}',
            style: TextStyle(
                color: type == 'Present'
                    ? Colors.green
                    : type == 'Absent'
                        ? Colors.red
                        : Colors.black),
          ),
        );
      });
}
