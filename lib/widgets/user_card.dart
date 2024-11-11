import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  Map<String, dynamic>? _user;

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  void _fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate a network call by setting data manually
    await Future.delayed(const Duration(seconds: 2));
    _user = {
      "name": "Abhimanyu Patil",
      "email": "abhimanyu.patil@example.com",
      "location": "Guntur, Jammu and Kashmir, India",
      "phone": "7454352151",
      "picture": "https://randomuser.me/api/portraits/men/92.jpg"
    };

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random User"),
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _user != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(_user!['picture']),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _user!['name'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _user!['email'],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _user!['location'],
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Phone: ${_user!['phone']}",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Text("No user data available."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUser,
        tooltip: 'Reload',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
