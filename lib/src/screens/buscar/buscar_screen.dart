import 'package:desafio_padawans_flutter/src/library/utils/colors_util.dart';
import 'package:desafio_padawans_flutter/src/screens/personagens/personagens_widget.dart';
import 'package:desafio_padawans_flutter/src/shared/Global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_plus/flutter_plus_exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuscarScreen extends StatefulWidget {
  @override
  _BuscarScreenState createState() => _BuscarScreenState();
}

class _BuscarScreenState extends State<BuscarScreen> {
  TextEditingController _txtBusca = TextEditingController();

  bool _valido;

  /* @override
  void initState() {
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.background,
      appBar: this._appBar(),
      body: this._buildBody(),
    );
  } //end build

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleSpacing: 0,
      title: Text(
        "Back",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: FlatButton(
        onPressed: () {
          navigatorPlus.back();
        },
        child: SvgPicture.asset(
          "assets/svg/arrow-back.svg",
          color: Colors.black,
        ),
      ),
      automaticallyImplyLeading: false,
    );
  } //end appBar

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: this._search(),
        ),
        SizedBox(height: 48),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Recently searched",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 24),
        this._exibirBusca(),
      ],
    );
  }

  FocusNode focus = FocusNode();
  Widget _search() {
    return TextFormField(
      focusNode: focus,
      controller: this._txtBusca,
      //Content
      maxLines: 1,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      //Decoration
      decoration: InputDecoration(
        //Border icon and background color
        fillColor: ColorsUtil.white,
        filled: true,
        prefixIcon: Container(
          padding: EdgeInsets.all(12),
          child: SvgPicture.asset(
            "assets/svg/search.svg",
            color: Colors.black,
          ),
        ),
        //Hint text and settings
        hintText: "Search here",
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.1),
        ),
        //CircularBorder
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        //OpenedBorderSettings
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: ColorsUtil.vermelho),
        ),
      ),

      onEditingComplete: () {
        _validaCampos();
        if (_valido) {
          print("VALIDO -> INICIAR BUSCA DE HEROI");
          marvelController.pesquisarPersonagem(this._txtBusca.text);
          //_txtBusca.clear();
          FocusScope.of(context).unfocus();
        }
      },
    );
  } //end _search

  void _validaCampos() {
    String str = this._txtBusca.text;
    if (str.isNotEmpty && str != null && str != "") {
      setState(() {
        this._valido = true;
      });
    } else {
      setState(() {
        this._valido = false;
      });
    } //end else
  } //end _validaCampos

  Widget _exibirBusca() {
    return Expanded(
      child: Observer(
        builder: (_) {
          if (marvelController.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.white,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(ColorsUtil.vermelho),
              ),
            );
          } else {
            if (marvelController.pesquisados.isEmpty ||
                marvelController.pesquisados == null) {
              return Center(
                child: Text(
                  "Nenhuma pesquisa recente encontrada!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            } else {
              return ListView(
                  padding: EdgeInsets.all(0),
                  children: marvelController.pesquisados
                      .map((personagem) => personagensWidget
                          .buildCardPersonagem(personagem, context))
                      .toList());
            }
          } //end else
        },
      ),
    );
  }
} //end class
