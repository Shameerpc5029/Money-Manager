import 'package:flutter/material.dart';
import 'package:money_manager/common/style/colors.dart';
import 'package:money_manager/common/style/sizedbox.dart';
import 'package:money_manager/screens/view/home/home_screen.dart';
import 'package:money_manager/screens/view/home/widgets/custom_text_filed.dart';

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
                  onPressed: () {},
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
                const Expanded(
                  child: CustomTextFormField(
                    labelText: 'Note',
                    prefixIcon: Icons.note_add_rounded,
                    textInputType: TextInputType.text,
                  ),
                ),
              ],
            ),
            KSizedBox().height10,
            const CustomTextFormField(
              labelText: 'Amount',
              prefixIcon: Icons.currency_rupee_outlined,
              textInputType: TextInputType.number,
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
            ),
            KSizedBox().height10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCardSmall(
                  text: "Income",
                  iconData: Icons.arrow_circle_down_outlined,
                  onTap: () {
                    print("income");
                  },
                ),
                KSizedBox().width10,
                CustomCardSmall(
                  text: "Outcome",
                  iconData: Icons.arrow_circle_up_outlined,
                  onTap: () {
                    print("Outcome");
                  },
                ),
              ],
            ),
            KSizedBox().height10,
          ],
        ),
      );
    },
  );
}
