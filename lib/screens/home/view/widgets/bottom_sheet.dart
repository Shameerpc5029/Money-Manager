import 'package:flutter/material.dart';
import 'package:money_manager/common/style/colors.dart';
import 'package:money_manager/common/style/sizedbox.dart';
import 'package:money_manager/screens/home/controller/home.dart';

import 'package:money_manager/screens/home/view/widgets/custom_card.dart';
import 'package:money_manager/screens/home/view/widgets/custom_text_filed.dart';
import 'package:provider/provider.dart';

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Consumer<HomeController>(
          builder: (context, value, child) {
            final hour = value.dateTime.hour.toString().padLeft(2, '0');
            final minute = value.dateTime.minute.toString().padLeft(2, '0');
            return Form(
              autovalidateMode: AutovalidateMode.always,
              key: value.formGlobalKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add new note",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().themeColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          value.saveData(context);
                        },
                        child: const Text(
                          'Save',
                        ),
                      )
                    ],
                  ),
                  KSizedBox().height10,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.camera_alt_rounded,
                          ),
                        ),
                      ),
                      KSizedBox().width10,
                      Expanded(
                        child: CustomTextFormField(
                          labelText: 'Note',
                          prefixIcon: Icons.note_add_rounded,
                          textInputType: TextInputType.text,
                          textEditingController: value.noteController,
                          validator: (p0) {
                            return value.noteValidator(p0);
                          },
                        ),
                      ),
                    ],
                  ),
                  KSizedBox().height10,
                  CustomTextFormField(
                    labelText: 'Amount',
                    prefixIcon: Icons.currency_rupee_outlined,
                    textInputType: TextInputType.number,
                    textEditingController: value.amountController,
                    validator: (p0) {
                      return value.amountValidation(p0);
                    },
                  ),
                  KSizedBox().height10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                            "${value.dateTime.day}/${value.dateTime.month}/${value.dateTime.year} $hour:$minute"),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          value.pickDateTime(context);
                        },
                        icon: const Icon(Icons.date_range_outlined),
                        label: const Text(
                          'Date & Time',
                        ),
                      ),
                    ],
                  ),
                  KSizedBox().height10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCardSmall(
                        text: "Income",
                        iconData: Icons.arrow_circle_down_outlined,
                        onTap: () {
                          value.incomeButtonPress();
                        },
                        backgroundColor: value.isClicked1 == true
                            ? AppColors().themeColor
                            : Colors.white,
                        foregroundColor: value.isClicked1 == true
                            ? Colors.white
                            : Colors.black,
                      ),
                      KSizedBox().width10,
                      CustomCardSmall(
                        text: "Outcome",
                        iconData: Icons.arrow_circle_up_outlined,
                        onTap: () {
                          value.outComeButtonPress();
                        },
                        backgroundColor: value.isClicked2 == true
                            ? AppColors().themeColor
                            : Colors.white,
                        foregroundColor: value.isClicked2 == true
                            ? Colors.white
                            : Colors.black,
                      ),
                    ],
                  ),
                  KSizedBox().height30,
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
