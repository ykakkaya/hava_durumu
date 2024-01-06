import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hava_durumu/controller/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(APPController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayseri İçin Haftalık Hava Durumu"),
        centerTitle: true,
      ),
      body: Obx(() => GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.weatherlist.length,
            itemBuilder: (context, index) {
              var item = controller.weatherlist[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80, child: Image.network(item.ikon.toString())),
                  Text(item.day.toString()),
                  Text(item.date.toString()),
                  Text(item.description.toString()),
                ],
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          )),
    );
  }
}
