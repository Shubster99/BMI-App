import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI'),
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
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var Result = "";
  var bgColor = Colors.indigo[100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Your BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text("Enter your Weight in kgs"),
                      prefixIcon: Icon(Icons.line_weight)),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height in Feets"),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height in inches"),
                      prefixIcon: Icon(Icons.height)),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inc = ftController.text.toString();
                        if (wt != "" && ft != "" && inc != "") {
                          // BMI Calculation
                          var iWt = int.parse(wt);
                          var iFt = int.parse(ft);
                          var iInc = int.parse(inc);

                          var tInch = (iFt * 12) + iInc;
                          var tCm = tInch * 2.54;
                          var totalMetre = tCm / 100;

                          var bmi = iWt / (totalMetre * totalMetre);
                          if (bmi > 25) {
                            bgColor = Colors.orange[500];
                          } else if (bmi < 18) {
                            bgColor = Colors.red[700];
                          } else {
                            bgColor = Colors.green[500];
                          }
                          setState(() {
                            Result =
                                "Your Body Mass Index is ${bmi.toStringAsFixed(2)}";
                          });
                        } else {
                          setState(() {
                            Result = "Please Fill All the Required Parameters";
                          });
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blueAccent), // Background color
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Text color
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                      ),
                      child: Text("Calculate")),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "$Result",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
