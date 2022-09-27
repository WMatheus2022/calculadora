import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  
  String numero = '';
  double primeiroNumero = 0.0;
  String opercao = '';

  void calcular(String tecla) async {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (numero.contains('.')) {
            // double numeroDouble = double.parse(numero);
            // numero = numeroDouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });

        break;
      case '+':
      case '-':
      case 'X':
      case '/':
        opercao = tecla;
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';

        break;

      case '=':
        double resultado = 0.0;
        if (opercao == '+') {
          resultado = primeiroNumero + double.parse(numero);
        }
        if (opercao == '-') {
          resultado = primeiroNumero - double.parse(numero);
        }
        if (opercao == '/') {
          resultado = primeiroNumero / double.parse(numero);
        }
        if (opercao == 'X') {
          resultado = primeiroNumero * double.parse(numero);
        }
        String resultadoString = resultado.toString();

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }

        break;

      case '<X':
      setState(() {
        if(numero.isNotEmpty) {
        numero = numero.substring(0, numero.length -1);
        }
      });
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Calculadora'),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: const TextStyle(fontSize: 80),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('AC');
                  },
                  child: const Text(
                    'AC',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('<X');
                  },
                  child: Image.asset('assets/images/seta.png', width: 70,),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('1');
                  },
                  child: const Text(
                    '1',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('2');
                  },
                  child: const Text(
                    '2',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('3');
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('/');
                  },
                  child: const Text(
                    '/',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('4');
                  },
                  child: const Text(
                    '4',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('5');
                  },
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('6');
                  },
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('X');
                  },
                  child: const Text(
                    'X',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                  },
                  child: const Text(
                    '7',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('8');
                  },
                  child: const Text(
                    '8',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('9');
                  },
                  child: const Text(
                    '9',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('+');
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('0');
                  },
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular(',');
                  },
                  child: const Text(
                    ',',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('=');
                  },
                  child: const Text(
                    '=',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('-');
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              children: const [Text('')],
            )
          ],
        ),
      ),
    );
  }
}
