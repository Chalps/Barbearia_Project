import 'package:barbearia_project/model/selection_model.dart';
import 'package:barbearia_project/model/servico_model.dart';
import 'package:barbearia_project/modules/shared/utils/colors.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<List<SelectionModel>>(
            // future: stateService.findAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView();
                } else {
                  return Center(
                    child: Text("Nenhum estado foi encontrado."),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(color: kPrimaryColor,),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(50),
                      // image: DecorationImage(
                      //   image: NetworkImage(),
                      // ),
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
