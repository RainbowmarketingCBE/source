import 'package:flutter/material.dart';
import 'package:rainbow/api/model/resource_model.dart';
import 'package:rainbow/utils/image_utils.dart';

class SubRoute extends StatelessWidget {
  final ProductList product;
  const SubRoute({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth,
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: const Color(0xee3C3C3C),
          title: Text(
            product.name ?? "",
            style: const TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding:const EdgeInsets.all(2),
        child: Padding(
          padding:const EdgeInsets.all(2),
          child: ListView(
            children: List.generate(product.images!.length,
                (index) => ImageUtil.getNetworkImage(product.images![index])),
          ),
        ),
      ),
    );
  }
}
