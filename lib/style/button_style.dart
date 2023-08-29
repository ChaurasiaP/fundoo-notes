import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/style/colors.dart';

var buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(100), bottomRight: Radius.circular(100)
        )
    ))
);
