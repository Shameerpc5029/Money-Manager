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
            return Column(
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
                    const CircleAvatar(
                      radius: 28,
                      child: Text('M'),
                    ),
                    KSizedBox().width10,
                    Expanded(
                      child: CustomTextFormField(
                        labelText: 'Note',
                        prefixIcon: Icons.note_add_rounded,
                        textInputType: TextInputType.text,
                        textEditingController: value.noteController,
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
                ),
                KSizedBox().height10,
                CustomTextFormField(
                  labelText: 'Date And time',
                  suffix: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                  ),
                  prefixIcon: Icons.date_range,
                  textInputType: TextInputType.datetime,
                  textEditingController: value.dateController,
                ),
                KSizedBox().height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCardSmall(
                      text: "Income",
                      iconData: Icons.arrow_circle_down_outlined,
                      onTap: () {},
                    ),
                    KSizedBox().width10,
                    CustomCardSmall(
                      text: "Outcome",
                      iconData: Icons.arrow_circle_up_outlined,
                      onTap: () {},
                    ),
                  ],
                ),
                KSizedBox().height10,
              ],
            );
          },
        ),
      );
    },
  );
}
