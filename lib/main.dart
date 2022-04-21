import 'package:flutter/material.dart';
import 'package:flutter_getx_base/bindings/initial_binding.dart';
import 'package:flutter_getx_base/commons/theme/custom_theme.dart';
import 'package:flutter_getx_base/configurations/app_configuration_manager.dart';
import 'package:flutter_getx_base/configurations/environment_type.dart';
import 'package:flutter_getx_base/route/route_name.dart';
import 'package:flutter_getx_base/route/route_page.dart';
import 'package:get/get.dart';

void main() async {
  await AppConfigurationManager.configure(
    environmentType: EnvironmentType.dev,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      getPages: RoutePage.pages,
      initialBinding: InitialBinding(),
      initialRoute: RouteName.login,
      enableLog: true,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
