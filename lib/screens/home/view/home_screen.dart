import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:money_manager/common/style/colors.dart';
import 'package:money_manager/common/style/sizedbox.dart';

import 'package:money_manager/screens/home/controller/home.dart';

import 'package:money_manager/screens/home/view/widgets/bottom_sheet.dart';
import 'package:money_manager/screens/home/view/widgets/custom_card.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<HomeController>(
        builder: (context, home, child) {
          return SingleChildScrollView(
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
                    autofocus: false,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.white,
                  ),
                ),
                SlidableAutoCloseBehavior(
                  closeWhenOpened: true,
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: home.dataFound.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        useTextDirection: true,
                        endActionPane: ActionPane(
                          motion: const BehindMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.green,
                              icon: Icons.edit,
                              label: 'Edit',
                              onPressed: (context) {},
                            ),
                            SlidableAction(
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Remove',
                              onPressed: (context) {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Confirm'),
                                      content: const Text(
                                          'Are you sure to delete this?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Close'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            home.deleteData(
                                                home.dataFound[index].id
                                                    .toString(),
                                                context,
                                                home.dataFound[index].note);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Delete'),
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            child: Text(
                              home.dataFound[index].note[0].toUpperCase(),
                            ),
                          ),
                          title: Text(home.dataFound[index].note),
                          subtitle: Text(
                            home.dataFound[index].date,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          trailing: Text(
                            "₹${home.dataFound[index].amount}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: home.dataFound[index].type == 'Outcome'
                                      ? Colors.red
                                      : Colors.green,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
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
