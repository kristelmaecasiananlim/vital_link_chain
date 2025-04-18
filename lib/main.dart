import 'package:flutter/material.dart';
import 'Pages/patient_medical_history_transactions.dart';
import 'Pages/patient_certificate.dart' as certificate;
import 'Pages/upload_medical_records.dart'
    as upload; // Step 1: Import the new page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/medical-access': (context) => const MedicalAccessPage(),
        '/certificate': (context) => const certificate.CertificatePage(),
        '/upload-medical-records':
            (context) =>
                const upload.CertificatePage(), // Step 2: Add new route
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

  void _goToMedicalAccessPage() {
    Navigator.pushNamed(context, '/medical-access');
  }

  void _goToCertificatePage() {
    Navigator.pushNamed(context, '/certificate');
  }

  void _goToUploadMedicalRecordsPage() {
    Navigator.pushNamed(
      context,
      '/upload-medical-records',
    ); // Step 3: Navigation method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _goToMedicalAccessPage,
              child: const Text('Go to Medical Access Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _goToCertificatePage,
              child: const Text('Go to Certificate Page'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _goToUploadMedicalRecordsPage, // Button for new page
              child: const Text('Go to Upload Medical Records Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
