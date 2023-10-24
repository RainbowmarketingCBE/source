import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow/api/model/resource_model.dart';
import 'package:rainbow/routs/dashboard/dashboard_controller.dart';
import 'package:maps_launcher/maps_launcher.dart';

class DashBoard extends StatefulWidget {
  final ProductDetails? productDetails;
  const DashBoard({super.key, this.productDetails});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DashboardController dashboardController = DashboardController();
  @override
  void initState() {
    super.initState();
    dashboardController.getResources(widget.productDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        actions: [
          Obx(
            () => dashboardController.menuList.isNotEmpty
                ? PopupMenuButton<int>(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => List.generate(
                      dashboardController.menuList.length,
                      (index) => PopupMenuItem(
                          value: index,
                          child: Text(
                            dashboardController.menuList[index],
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    //  offset: Offset(0, 50),
                    color: const Color(0xee3C3C3C),
                    elevation: 2,
                    // on selected we show the dialog box
                    onSelected: (value) {
                      dashboardController.navigateBody(value);
                    },
                  )
                : const SizedBox(),
          )
        ],
        centerTitle: true,
        backgroundColor: const Color(0xee3C3C3C),
        title: Obx(() => dashboardController.shopName!.value.isNotEmpty
            ? Text(
                dashboardController.shopName?.value ?? "",
                style: const TextStyle(color: Colors.white),
              )
            : const SizedBox()),
      ),
      body: Obx(() => dashboardController.isLoading.value
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: List.generate(
                          dashboardController.imageList.length,
                          (index) => dashboardController.imageList[index]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xee3C3C3C),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              MapsLauncher.launchCoordinates(
                                  dashboardController.lat,
                                  dashboardController.long);
                            },
                            child: Text(
                              dashboardController.address?.value ?? "",
                              style: const TextStyle(color: Color(0xeeE27317)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                dashboardController.phoneList.length,
                                (index) => Text(
                                      "${dashboardController.phoneList[index]} ",
                                      style: const TextStyle(
                                          color: Color(0xeeE27317)),
                                    )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!!"),
          content: Text("You are awesome!"),
          actions: [
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
