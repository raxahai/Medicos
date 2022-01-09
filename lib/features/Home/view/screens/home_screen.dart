import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_me/core/widgets/app_bar_widget.dart';
import 'package:test_me/features/Home/view_model/home_view_model.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeViewModel homeViewModel = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Get.until((route) => route.isFirst);
                },
                child: Image.asset(
                  "assets/icons/lock.png",
                  width: 7.w,
                  height: 7.h,
                ),
              ),
            )
          ],
        ),
        body: homeViewModel.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(left: 10, top: 20, right: 10),
                child: Column(
                  children: [
                    userDetailWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Medication:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 20),
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 105,
                      child: Column(
                        children: [
                          customKeyValue(
                            key: "Name: ",
                            value: "${homeViewModel.associatedDrug!.name}",
                          ),
                          customKeyValue(
                              key: "Dose: ",
                              value: "${homeViewModel.associatedDrug!.dose}"),
                          customKeyValue(
                              key: "Strength: ",
                              value:
                                  "${homeViewModel.associatedDrug!.strength}"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget customKeyValue({required String key, required String value}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          Text(
            key,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            value.isEmpty ? "N/A" : value,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget userDetailWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Container(
                    child: Image.asset(
                  "assets/icons/user.png",
                  width: 35,
                  height: 35,
                )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Syed Raza Haider",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
