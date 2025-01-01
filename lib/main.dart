import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeControllers();

  // Check if the user is logged in
  bool isLoggedIn = await Get.find<LoginController>().isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

Future<void> initializeControllers() async {
  Get.put(LoginController());
  Get.put(OnboardingController());
  Get.put(ProfileSetupController());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Automatically switch between light and dark themes
      initialRoute: isLoggedIn ? '/home' : '/onboarding',
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: Theme.of(context).textTheme.headlineMedium),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Drawer Header',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('Home', style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text('Logout', style: Theme.of(context).textTheme.bodyMedium),
              onTap: () {
                Get.find<LoginController>().logout();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // GetBuilder<CounterController>(
            //   init: CounterController(),
            //   builder: (controller) {
            //     return Text(
            //       '${controller.counter}',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_outlined),
            label: 'delivery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'consultations',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.find<CounterController>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class CounterController extends GetxController {
  var counter = 0;

  void increment() {
    counter++;
    update();
  }
}
