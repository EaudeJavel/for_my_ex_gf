import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/provider.dart';

class DropdownInline extends StatefulWidget {
  const DropdownInline({
    super.key,
    required this.items,
    required this.onChanged,
  });

  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  State<DropdownInline> createState() => _DropdownInlineState();
}

class _DropdownInlineState extends State<DropdownInline> {
  String? _value;

  Color tdm(OnDarkMode onDarkMode) {
    return onDarkMode.textDarkmode;
  }

  Color _getColor(String value, OnDarkMode onDarkMode) {
    if (value == _value) {
      return onDarkMode.textDarkmode;
    } else if (onDarkMode.onDarkMode) {
      return onDarkMode.bgDarkmode;
    } else {
      return onDarkMode.textDarkmode;
    }
  }

  @override
  Widget build(BuildContext context) {
    final onDarkMode = context.watch<OnDarkMode>();

    return DropdownButton<String>(
      value: _value,
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: TextStyle(
                color: _getColor(value, onDarkMode),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
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
