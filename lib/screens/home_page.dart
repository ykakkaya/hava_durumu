import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hava_durumu/controller/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(APPcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: ((context, index) {
              var item = controller.list[index];
              return ListTile(
                title: Text(item.day),
              );
            })),
      ),
    );
  }
}
