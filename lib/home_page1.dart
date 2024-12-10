import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  String respostaFinal = '';

  final dio = Dio();
  Map<String, dynamic>? endereco;


  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/01001000/json/');

    return response.data;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Pagina Inicial'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 356,
            ),
            Text('Consumo de APIS usando o DIO'),
            ElevatedButton(onPressed:() async {
              Map<String, dynamic>? enderecoAuxiliar = await getHttp();
              setState(() {
                endereco = enderecoAuxiliar;
              });
            },
              child: Text('Consultar')),
            SizedBox(height: 32,),
            Text('${endereco?['logradouro'] ??''}'),
            Text('${endereco?['bairro']}'),
            Text('${endereco?['estado']}'),


          ],
        ),
      ),
    );
  }
}
