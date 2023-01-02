import 'package:flutter/material.dart';

class DropdownInline extends StatefulWidget {
  const DropdownInline(
      {super.key, required this.items, required this.onChanged});

  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  State<DropdownInline> createState() => _DropdownInlineState();
}

class _DropdownInlineState extends State<DropdownInline> {
  String? _value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _value = value;
        });
        widget.onChanged(value!);
      },
    );
  }
}
