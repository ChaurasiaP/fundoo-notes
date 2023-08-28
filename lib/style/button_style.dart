import 'package:flutter/material.dart';
import 'package:fundoo_notes_app/style/colors.dart';

var buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(activeTab),
    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)
        )
    ))
);
