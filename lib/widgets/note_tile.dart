import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          child: Row(
            children: [
              Icon(Icons.file_copy_outlined),
              SizedBox(width: 14),
              Flexible(
                child: Text(title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ],
          )),
    );
  }
}
