
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../core/constants/app_color.dart';
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
              hintStyle: Get.textTheme.bodyMedium!.copyWith(
                color: AppColor.hintTextColor,
                fontWeight: FontWeight.w200,
                decoration: TextDecoration.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 16.0.w),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: isDisabled == true ? AppColor.disabledBorder : AppColor.textFieldBorderColor,
              //     width: 2
              //   ),
              // ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.disabledBorder,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? AppColor.textFieldBorderColor,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColor.secondary,
                  width: 2.w,
                ),
                borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
              ),
            ),
          );
        },
        itemBuilder: (context, suggestion) {
          return Container(
            color: Get.isDarkMode ? AppColor.black : AppColor.white,
            child: ListTile(
              title: Text(suggestion),
              textColor: Get.isDarkMode ? AppColor.white : AppColor.black54,
            ),
          );
        },
        onSelected: (suggestion) async {
          onChangedOption(suggestion);
          textController.text = suggestion;

          focusNode?.unfocus();
          // FocusScope.of(context).requestFocus(focusNode);

          // controller.searchType.value = 'location';
          // controller.setPlaceDetails(suggestion);
          //
          // controller.searchTextController.text = suggestion.placeName ?? '';
          // log('TypeAhead controller: ${controller.searchTextController.text}');
          //
          // /// clear all filter
          // controller.clearAllFilter();
        },
      );
    }else{
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: '${labelText ?? 'Select'} ${isMandatory == false ? '' : '*'}',
          hintText: hintText,
          hintStyle: Get.textTheme.bodyMedium!.copyWith(
            color: AppColor.hintTextColor,
            fontWeight: FontWeight.w200,
            decoration: TextDecoration.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.disabledBorder,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? AppColor.textFieldBorderColor,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(AppSize.smallBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primary,
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
        hint: Text(
          hintText ?? 'Select an option',
          style: Get.textTheme.bodyMedium!.copyWith(
            color: AppColor.hintTextColor,
            fontWeight: FontWeight.w200,
            decoration: TextDecoration.none,
          ),
        ),
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
