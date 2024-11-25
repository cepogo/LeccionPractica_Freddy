import 'package:flutter/material.dart';
import 'utils/calculador_cilindro.dart';

void main() => runApp(CylinderApp());

class CylinderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CylinderHomePage(),
    );
  }
}

class CylinderHomePage extends StatefulWidget {
  @override
  _CylinderHomePageState createState() => _CylinderHomePageState();
}

class _CylinderHomePageState extends State<CylinderHomePage> {
  final _controllerDimension = TextEditingController();
  final _controllerHeight = TextEditingController();
  String _result = "";

  void _calculate(bool isRadius) {
    try {
      final dimension = double.parse(_controllerDimension.text);
      final height = double.parse(_controllerHeight.text);

      final baseArea = isRadius
          ? cilindroCalculador.calculateBaseAreaByRadius(dimension)
          : cilindroCalculador.calculateBaseAreaByDiameter(dimension);
      final volume = cilindroCalculador.calculateVolume(baseArea, height);

      setState(() {
        _result =
        "Área Basal: ${baseArea.toStringAsFixed(2)}\nVolumen: ${volume.toStringAsFixed(2)}";
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
        title: Text("Cálculo de Cilindros"),
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
                "Calcula el área basal y el volumen de un cilindro",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controllerDimension,
                decoration: InputDecoration(
                  labelText: "Ingrese radio o diámetro",
                  hintText: "Ejemplo: 7.5",
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
                controller: _controllerHeight,
                decoration: InputDecoration(
                  labelText: "Ingrese la altura",
                  hintText: "Ejemplo: 10",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _calculate(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[600],
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Con Radio",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _calculate(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Con Diámetro",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
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
