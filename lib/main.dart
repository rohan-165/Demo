import 'package:demo/name_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _counter = 0;
  final ValueNotifier<String> _name = ValueNotifier<String>('');

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _name,
          builder: (_, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Hi, ",
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: <TextSpan>[
                      TextSpan(
                        text: value.isEmpty ? '_ _ _ _' : ' $value',
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  'Your Count is :',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _button(
                      onTap: () {
                        if (_name.value.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => NameScreen(
                                    callBack: (value) {
                                      _name.value = value;
                                    },
                                  ),
                            ),
                          );
                        } else {
                          _incrementCounter();
                        }
                      },
                      icon: Icons.add,
                    ),
                    const SizedBox(width: 40),
                    _button(
                      onTap: () {
                        if (_name.value.isEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => NameScreen(
                                    callBack: (value) {
                                      _name.value = value;
                                    },
                                  ),
                            ),
                          );
                        } else {
                          _decrementCounter();
                        }
                      },
                      icon: Icons.remove,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _button({required IconData icon, required Function() onTap}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, size: 30),
        ),
      ),
    );
  }
}
