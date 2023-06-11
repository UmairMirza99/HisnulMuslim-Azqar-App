import 'package:flutter/material.dart';

import 'colors.dart';

Widget appBarView({required String label, required Function function}) {
  return GestureDetector(
    onTap: () => function(),
    child: Container(
      color: Colors.transparent,
      child: Row(
        children: [
          const Icon(
            Icons.keyboard_double_arrow_left,
            color: darkMehroonColor,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              color: lightMehroonColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  );
}
