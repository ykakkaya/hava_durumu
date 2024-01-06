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
<<<<<<< HEAD
      appBar: AppBar(),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: ((context, index) {
              var item = controller.list[0][index];
              return ListTile(
                title: Text(item.day),
              );
            })),
=======
      appBar: AppBar(
        title: const Text("Merhaba"),
        centerTitle: true,
>>>>>>> 39d535a44b73ed0ca24c2e7f77c226362cbb119e
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
