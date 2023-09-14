import 'package:flutter/material.dart';
import 'package:recipes/utils/constants.dart';
import '../model/Meal.dart';

class MoreMealInfo extends StatelessWidget {
  const MoreMealInfo({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          meal.name,
                          textAlign: TextAlign.start,
                          style: bigBoldTitle,
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {
                              // launch(meal.websiteLink);
                            },
                            icon: const Icon(Icons.wb_cloudy_rounded),
                            color: appColor,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: appColor,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.categorie, style: title),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.description, style: subTitle),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
