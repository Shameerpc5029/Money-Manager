import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/common/style/colors.dart';
import 'package:money_manager/common/style/sizedbox.dart';
import 'package:money_manager/screens/view/home/widgets/bottom_sheet.dart';
import 'package:money_manager/screens/view/home/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.more_horiz_outlined,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Good morning...",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            Text(
              "Shameer PC",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/unnamed.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Card(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffFFA51F),
                        Color.fromARGB(164, 255, 0, 0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "₹2000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      KSizedBox().height20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          CustomCard(
                            title: 'Income',
                            subTitle: "₹2000",
                            color: Colors.green,
                            iconData: Icons.arrow_circle_down_rounded,
                          ),
                          CustomCard(
                            title: "Outcome",
                            subTitle: "₹2000",
                            color: Colors.red,
                            iconData: Icons.arrow_circle_up_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            KSizedBox().height30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "History",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt,
                  ),
                  label: Text(
                    'Filter',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            Card(
              elevation: 3,
              child: CupertinoSearchTextField(
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.white,
              ),
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('$index'),
                  ),
                  title: Text('Mobile reacharge $index'),
                  subtitle: Text(
                    'SubText $index',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: Text(
                    "₹${index++}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.red),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().themeColor,
        foregroundColor: Colors.white,
        onPressed: () {
          bottomSheet(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class CustomCardSmall extends StatelessWidget {
  final String text;
  final IconData iconData;
  final void Function() onTap;
  const CustomCardSmall({
    super.key,
    required this.text,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.16),
            )
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(
              iconData,
            ),
            KSizedBox().width10,
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}


