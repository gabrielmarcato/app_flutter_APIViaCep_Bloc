import 'package:flutter/material.dart';
import 'package:viacep_api_bloc/src/models/endereco_model.dart';
import 'package:viacep_api_bloc/src/blocs/viacep_bloc.dart';

class ViewViaCep extends StatelessWidget {
  BlocViacep bloc = BlocViacep();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API VIACEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                bloc.input.add(value);
              },
              decoration: InputDecoration(
                hintText: "Digite seu CEP",
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: StreamBuilder<EnderecoModel>(
                stream: bloc.output,
                initialData: EnderecoModel(
                    bairro: "",
                    logradouro: "",
                    complemento: "",
                    cep: "",
                    localidade: "",
                    uf: "",
                    ibge: "",
                    ddd: ""),
                builder: (context, snapshot) {
                  EnderecoModel model = snapshot.data;
                  if (snapshot.hasError || model.erro == true) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nenhum valor encontrado',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("CEP: ${model.cep}"),
                        Text("Logradouro: ${model.logradouro}"),
                        Text("Complemento: ${model.complemento}"),
                        Text("Bairro: ${model.bairro}"),
                        Text("Localidade: ${model.localidade}"),
                        Text("UF: ${model.uf}"),
                        Text("IBGE: ${model.ibge}"),
                        Text("DDD: ${model.ddd}"),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
