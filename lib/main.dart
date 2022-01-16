import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm_620710378',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}
final _lengthController = TextEditingController();
final _girthController = TextEditingController();
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  final _controller = TextEditingController();

  @override




  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(

        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Container(

          decoration: BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/images/bg.jpg"), fit: BoxFit.cover,),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text('PIG WEIGHT',
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.pinkAccent.shade200)),
                    Text('CALCULATOR',
                        style: TextStyle(
                            fontSize: 36.0,
                            color: Colors.pinkAccent.shade200)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/pig.png',
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text('LENGTH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                              const Text('(cm)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                                child: TextField(
                                    controller: _lengthController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter length',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20.0)
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text('GIRTH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                              const Text('(cm)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                                child: TextField(
                                    controller: _girthController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter girth',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20.0)
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(onPressed: (){
                  var length_text = _lengthController.text;
                  var girth_text =  _girthController.text;
                  double? length = double.tryParse(length_text);
                  double? girth = double.tryParse(girth_text);

                  if(length == null || girth == null){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("ERROR"),
                          content: const Text("Invalid input"),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    double weight = (girth/100) * (girth/100) * (length/100) * 69.3;
                    double price = weight * 112.50;
                    double Tolerance_weight_max = (0.03 * weight)+weight;
                    double Tolerance_price_max = (0.03 * price)+price;
                    double Tolerance_weight_min = weight-(0.03 * weight);
                    double Tolerance_price_min = price-(0.03 * price);
                    showDialog(

                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Image.asset('assets/images/ic_pig.png',
                                    width: 30, height: 30),
                                Text('  RESULT'),
                              ],
                            ),
                          ),
                          content: Text(
                              'Weight: ${Tolerance_weight_min
                                  .round()} - ${Tolerance_weight_max
                                  .round()} kg\nPrice: ${Tolerance_price_min
                                  .round()} - ${Tolerance_price_max
                                  .round()} Baht'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                    child: Text('CALCULATE')),
              ),
            ],
          ),
        ),),
    );
  }
}
