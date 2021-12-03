
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerUtil{

  static void pickerDate(BuildContext context, DateChangedCallback onConfirm,
      {DateChangedCallback? onChange, DateCancelledCallback? onCancel,DateTime? currentTime}) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2100, 1, 1),
        currentTime: currentTime == null
            ? DateTime.now()
            : currentTime,
        onChanged: onChange,
        onConfirm: onConfirm,
        onCancel: onCancel,
        locale: LocaleType.zh);
  }
}