import 'package:desafio_padawans_flutter/src/library/data/PersonagemDTO.dart';
import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/buscar/buscar_screen.dart';
import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_controller.dart';
import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_widget.dart';
import 'package:desafio_padawans_flutter/src/shared/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_svg/svg.dart';

class PersonagensScreen extends StatefulWidget {
  @override
  _PersonagensScreenState createState() => _PersonagensScreenState();
}

class _PersonagensScreenState extends State<PersonagensScreen> {
  List<String> _buttoms = ["Popular", "A-Z", "Last viewed"];
  final popularController = ScrollController();
  final azController = ScrollController();

  @override
  void initState() {
    //Lista de populares
    popularController.addListener(() {
      if (popularController.position.maxScrollExtent ==
          popularController.offset) {
        print('Popular Chegou ao fim');
        marvelController.popularOffset += 20;
        print("Novo offset de populares = " +
            marvelController.popularOffset.toString());
        marvelController.buscarPersonagensPopulares();
        setState(() {
          marvelController.populares;
        });
      }
    });
    //Lista de A-Z
    azController.addListener(() {
      if (azController.position.maxScrollExtent == azController.offset) {
        print('A-Z Chegou ao fim');
        marvelController.azOffset += 20;
        print("Novo offset = " + marvelController.azOffset.toString());
        marvelController.buscarPersonagens();
        setState(() {
          marvelController.personagens;
        });
      }
    });
    super.initState();
  } //end initState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._appBar(),
      body: Column(
        children: [
          this._buildButtons(),
          this._buildBody(context),
        ],
      ),
    );
  } //end build

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: null,
      leading: null,
      automaticallyImplyLeading: false,
      actions: [
        FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            navigatorPlus.navigate(BuscarScreen());
          },
          child: SvgPicture.asset(
            "assets/svg/search.svg",
            color: Colors.black,
          ),
        ),
      ],
    );
  } //end _appBar

  Widget _buildButtons() {
    return Container(
      height: 38,
      //color: Colors.green,
      child: ListView(
        padding: EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        children: this._buttoms.map(
          (topic) {
            int index = this._buttoms.indexOf(topic);
            return this._buttom(topic, index);
          },
        ).toList(),
      ),
    );
  } //end _buildButtons

  Widget _buttom(String nome, int index) {
    return personagensWidget.selecionado == index
        ? ButtonPlus(
            margin: EdgeInsets.only(right: 16),
            radius: RadiusPlus.all(14),
            color: ColorsUtil.getColorByHex("F70D0C"),
            child: Text(
              nome,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              setState(() {
                personagensWidget.selecionado = index;
                print("Selecionado: " + this._buttoms[index]);
              });
            },
          )
        : InkWell(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 16),
              child: Text(
                nome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                personagensWidget.selecionado = index;
                print("Selecionado: " + this._buttoms[index]);
              });
            },
          );
  } //end _buttom

  Widget _buildBody(BuildContext context) {
    return ContainerPlus(
      //color: Colors.pink,
      isExpanded: true,
      margin: EdgeInsets.only(top: 16),
      child: this._selector(),
    );
  } //end buildBody

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.white,
        valueColor: new AlwaysStoppedAnimation<Color>(ColorsUtil.vermelho),
      ),
    );
  } //end loading

  bool listasDisponiveis() {
    return (marvelController.isLoading);
  } //end listasDisponiveis

  Widget _selector() {
    return Observer(
      builder: (_) {
        if (marvelController.isLoading) {
          return this.loading();
        } else {
          //Se populares selecionados
          if (personagensWidget.selecionado == 0) {
            return this._populares();
          }
          //De A-Z
          else if (personagensWidget.selecionado == 1) {
            return this._alfabeticaAZ();
          }
          //Vistos por último
          else {
            return this._vistosUltimos();
          }
        } //end else
      },
    );
  } //end _selector

  Widget _populares() {
    return ListView(
        controller: this.popularController,
        children: marvelController.populares
            .map((personagem) =>
                personagensWidget.buildCardPersonagem(personagem, context))
            .toList());
  } //end _populares

  Widget _alfabeticaAZ() {
    return ListView(
        controller: azController,
        children: marvelController.personagens
            .map((personagem) =>
                personagensWidget.buildCardPersonagem(personagem, context))
            .toList());
  } //end _alfabeticaAZ()

  Widget _vistosUltimos() {
    if (marvelController.ultimos.isEmpty) {
      return Center(
        child: Text(
          "Experimente saber mais sobre algum herói!",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      );
    } //Senão, apresentar últimos heróis visualizados
    else {
      return ListView(
          children: marvelController.ultimos
              .map((personagem) =>
                  personagensWidget.buildCardPersonagem(personagem, context))
              .toList());
    } //end else visto por último
  } //end _vistosUltimos

} //end class
