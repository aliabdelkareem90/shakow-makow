import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  @required
  String? label;
  String? hint;
  @required
  IconData? iconData;
  @required
  TextEditingController? controller;
  @required
  TextInputType? type;
  int? maxLength;
  @required
  Function? onSubmitted;
  @required
  Function? onSaved;
  @required
  Function? validate;
  Function? onTap;
  Function? onChange;

  DefaultTextFormField({
    this.label,
    this.hint,
    this.iconData,
    this.controller,
    this.type,
    this.maxLength,
    this.onSubmitted,
    this.onSaved,
    this.validate,
    this.onTap,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          labelText: label,
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        keyboardType: type,
        controller: controller,
        maxLength: maxLength,
        onFieldSubmitted: onSubmitted!(String),
        onSaved: onSaved!(String),
        onTap: onTap!(String),
        validator: validate!(String),
      ),
    );
  }
}
