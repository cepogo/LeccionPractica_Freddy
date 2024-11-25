import 'package:flutter/material.dart';
import 'utils/calculadorhipotenusa.dart';

void main() => runApp(HypotenuseApp());

class HypotenuseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HypotenuseHomePage(),
    );
  }
}

class HypotenuseHomePage extends StatefulWidget {
  @override
  _HypotenuseHomePageState createState() => _HypotenuseHomePageState();
}

class _HypotenuseHomePageState extends State<HypotenuseHomePage> {
  final _controllerSideA = TextEditingController();
  final _controllerSideB = TextEditingController();
  String _result = "";

  void _calculateHypotenuse() {
    try {
      final sideA = double.parse(_controllerSideA.text);
      final sideB = double.parse(_controllerSideB.text);

      final hypotenuse = TriangleCalculator.calculateHypotenuse(sideA, sideB);

      setState(() {
        _result = "La hipotenusa es: ${hypotenuse.toStringAsFixed(2)}";
      });
    } catch (e) {
      setState(() {
        _result = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de Hipotenusa"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.teal[400]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Ingrese los lados del triángulo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controllerSideA,
                decoration: InputDecoration(
                  labelText: "Lado A",
                  hintText: "Ejemplo: 3.0",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controllerSideB,
                decoration: InputDecoration(
                  labelText: "Lado B",
                  hintText: "Ejemplo: 4.0",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateHypotenuse,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[800],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Calcular Hipotenusa",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              if (_result.isNotEmpty)
                Card(
                  elevation: 4,
                  color: Colors.teal[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _result,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[900],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
