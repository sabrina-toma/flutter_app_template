
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/app_widgets/text/app_text_widgets.dart';
import 'package:flutter_app_template/src/core/themes/theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../core/constants/app_size.dart';

class AppDropDownWidget extends StatelessWidget {
  final TextEditingController textController;
  final bool? isDisabled;
  final bool? isMandatory, isTypeAhead ;
  final String? hintText;
  final String? labelText;
  final List<String>? itemsList;
  final Color? borderColor;
  final Function(String) onChangedOption;
  final FocusNode? focusNode;

  const AppDropDownWidget(
      {super.key,
      this.isDisabled = false,
      this.isMandatory = true,
      this.hintText,
      this.labelText,
      this.itemsList,
      this.borderColor,
      this.isTypeAhead = true,
      required this.onChangedOption,
      required this.textController,
      this.focusNode,
      });

  @override
  Widget build(BuildContext context) {
    if(isTypeAhead == true){
      return TypeAheadField<String>(
        focusNode: focusNode,
        hideKeyboardOnDrag: true,
        hideOnUnfocus: true,
        hideOnSelect: true,
        controller: textController,
        suggestionsCallback: (search) async {
          // If search is empty, return the full list when the field is clicked
          if (search.isEmpty) {
            return itemsList ?? []; // Show entire list on click/focus
          }

          // Filter the list based on the search input
          return itemsList?.where((text) => text.toLowerCase().contains(search.toLowerCase())).toList() ?? [];
        },
        builder: (context, controller, focusNode) {
          return TextField(
            enabled: isDisabled == false,
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              // border: const OutlineInputBorder(),
              labelText: '${labelText ?? 'Type'} ${isMandatory != null &&  isMandatory == false? '' : '*'}',
              hintText: hintText,
              hintStyle: TextStyleType.hintTextStyle,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.0.w),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: isDisabled == true ? AppColor.disabledBorder : AppColor.textFieldBorderColor,
              //     width: 2
              //   ),
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.disabledColor,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? context.colors.outline,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colors.secondary,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
            ),
          );
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: AppText(text: suggestion, textStyle: TextStyleType.bodyMedium),
          );
        },
        onSelected: (suggestion) async {
          onChangedOption(suggestion);
          textController.text = suggestion;

          focusNode?.unfocus();
        },
      );
    }else{
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: '${labelText ?? 'Select'} ${isMandatory == false ? '' : '*'}',
          hintText: hintText,
          hintStyle: TextStyleType.hintTextStyle,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.disabledColor,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? context.colors.outline,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.colors.primary,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
        ),
        value: textController.text.isNotEmpty ? textController.text : null,
        style: Get.textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w200,
          decoration: TextDecoration.none,
        ),
        hint: AppText(text: hintText ?? 'Select an option', textStyle: TextStyleType.hintTextStyle,),
        items: itemsList?.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: isDisabled == true
            ? null
            : (value) {
          if (value != null) {
            textController.text = value;
            onChangedOption(value);
          }
        },
        validator: (value) => value == null ? 'Please select an option' : null,
      );
    }
  }
}
