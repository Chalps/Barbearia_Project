import 'package:barbearia_project/model/tipo_servico.dart';

class ServicoModel {
  final String name;
  final String descricao;
  final double preco;
  final DateTime previsao;
  final TipoServico tipo;

  ServicoModel(
      {required this.name,
      required this.preco,
      required this.descricao,
      required this.previsao,
      required this.tipo});
}
