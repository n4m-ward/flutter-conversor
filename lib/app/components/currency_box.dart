import 'package:conversor/app/service/currency_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  void Function(CurrencyService?)? onChanged;
  final List<CurrencyService> items;
  final TextEditingController controller;
  final CurrencyService selectedItem;

  CurrencyBox(
      {Key? key,
      required this.items,
      required this.controller,
      required this.onChanged,
      required this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton<CurrencyService>(
                value: selectedItem,
                iconEnabledColor: Colors.amber,
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: items
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: onChanged,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            )),
      ],
    );
  }
}
