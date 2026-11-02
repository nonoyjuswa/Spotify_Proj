import 'package:flutter/material.dart';
import 'addAccount.dart';
import 'premium.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),   
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const CircleAvatar(child: Icon(Icons.person)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.person)),
                  SizedBox(width: 12),
                  Text('Nonoy', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Add account'),
              onTap: () {
                Navigator.pop(context); // close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddAccountPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text('Premium'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PremiumPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Your music')),
    );
  }
}
