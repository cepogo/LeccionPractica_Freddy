import 'package:flutter/material.dart';
import 'utils/calculador_circunferencia.dart';

void main() => runApp(CircumferenceApp());

class CircumferenceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: CircumferenceHomePage(),
    );
  }
}

class CircumferenceHomePage extends StatefulWidget {
  @override
  _CircumferenceHomePageState createState() => _CircumferenceHomePageState();
}

class _CircumferenceHomePageState extends State<CircumferenceHomePage> {
  final _controller = TextEditingController();
  String _result = "";

  void _calculate(bool isRadius) {
    try {
      final value = double.parse(_controller.text);
      final result = isRadius
          ? calcularLonguitudCircunferencia.calculateByRadius(value)
          : calcularLonguitudCircunferencia.calculateByDiameter(value);
      setState(() {
        _result = "La longitud es: ${result.toStringAsFixed(2)}";
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
        title: Text("Calculadora de Circunferencias"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Calcula la longitud de una circunferencia:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: "Ingrese radio o diámetro",
                        hintText: "Ejemplo: 7.5",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _calculate(true),
                          icon: Icon(Icons.radio_button_checked),
                          label: Text("Radio"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _calculate(false),
                          icon: Icon(Icons.circle),
                          label: Text("Diámetro"),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.teal[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
