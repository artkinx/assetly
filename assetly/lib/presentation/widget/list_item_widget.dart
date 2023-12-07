import 'package:assetly/core/helper/constants_helper.dart';
import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({super.key});

  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(height: 45, child: CircleAvatar()),
              SizedBox(
                width: 9,
              ),
              Column(
                children: [
                  Text(
                    "My Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Date is...",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: greyColor,
                    ),
                  )
                ],
              )
            ],
          ),
          Text(
            "\$100.00",
            style: TextStyle(
              fontSize: 14,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
