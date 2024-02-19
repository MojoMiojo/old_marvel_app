import 'package:desafio_padawans_flutter/src/library/data/PersonagemDTO.dart';
import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_controller.dart';
import 'package:desafio_padawans_flutter/src/shared/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';
import 'package:flutter_svg/svg.dart';

class PersonagensWidget {
  int selecionado = 0;

  Widget buildCardPersonagem(PersonagemDTO personagem, BuildContext context) {
    return ContainerPlus(
      //color: Colors.amberAccent,
      shadows: [
        ShadowPlus(
          color: Colors.black,
          opacity: 0.5,
          blur: 8,
          spread: 0.5,
          moveRight: 4,
          moveDown: 5,
        )
      ],
      radius: RadiusPlus.all(24),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerPlus(
            height: 212,
            width: 160,
            child: Image.network(
              this.securityImageString(personagem.thumbnail.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          //Lado direito
          ContainerPlus(
            height: 212,
            isExpanded: true,
            color: Colors.white,
            //color: Colors.blueAccent,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                this._buildInformacoesPersonagem(true, personagem),
                this._buildMoreInfo(personagem, context),
              ],
            ),
            //More info
          )
        ],
      ),
    );
  } //end buildCardPersonagen

  //Altera o http para htttps
  String securityImageString(String str) {
    return "https" + str.substring(4, str.length);
  } //end securityImageString

  Widget _buildInformacoesPersonagem(bool menu, PersonagemDTO personagem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextPlus(
          personagem.name,
          fontWeight: FontWeight.w800,
          fontSize: 22,
          color: Colors.black,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        TextPlus(
          "By Marvel",
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: Colors.black.withOpacity(0.35),
          maxLines: 3,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 18),
        menu
            ? TextPlus(
                personagem.description.isEmpty
                    ? "Descrição não disponível."
                    : personagem.description,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black.withOpacity(0.35),
                maxLines: 3,
                textOverflow: TextOverflow.ellipsis,
              )
            : Container(),
      ],
    );
  } //end buildInformacoesPersonagem

  Widget _buildMoreInfo(PersonagemDTO personagem, BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        marvelController.adicionarUltimo(personagem);
        print(marvelController.ultimos);
        this._heroi(personagem, context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextPlus(
            "More info",
            fontWeight: FontWeight.w800,
            color: Colors.black,
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
    );
  }

  void _heroi(PersonagemDTO personagem, BuildContext context) {
    bottomSheetPlus.show(
      heightPercentScreen: 0.96,
      child: ContainerPlus(
        color: Colors.white,
        radius: RadiusPlus.only(topLeft: 24, topRight: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              this.securityImageString(personagem.thumbnail.imageUrl),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.60,
            ),
            SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  //color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: this._buildInformacoesPersonagem(false, personagem),
                ),
                Positioned(
                  child: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset("assets/svg/share.svg"),
                  ),
                  right: 24,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                //color: Colors.pink,
                child: ListView(
                  children: [
                    TextPlus(
                      personagem.description.isEmpty
                          ? "Descrição não disponível."
                          : personagem.description,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.35),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} //end class
