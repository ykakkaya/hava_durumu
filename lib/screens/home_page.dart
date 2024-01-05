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
        title: const Text("Merhaba"),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.weatherlist.length,
            itemBuilder: (context, index) {
              var item = controller.weatherlist[index];
              return Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 100,
                        child: Image.network(item.ikon.toString())),
                    Text(item.day.toString()),
                    Text(item.date.toString()),
                    Text(item.description.toString()),
                  ],
                ),
              );
            },
          )),
    );
  }
}
