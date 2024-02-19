import 'package:desafio_padawans_flutter/src/library/apis/personagem_api.dart';
import 'package:desafio_padawans_flutter/src/library/data/PersonagemDTO.dart';
import 'package:mobx/mobx.dart';
part 'personagens_controller.g.dart';

class PersonagensController = _PersonagensController
    with _$PersonagensController;

abstract class _PersonagensController with Store {
  final _personagemApi = PersonagemApi();
  int azOffset = 0;
  int popularOffset = 0;

  @action
  _PersonagensController() {
    this.buscarPersonagensPopulares();
    this.buscarPersonagens();
  }

  @observable
  bool isLoading = false;

  @observable
  ObservableList<PersonagemDTO> _personagens =
      ObservableList<PersonagemDTO>.of([]);

  @observable
  List<PersonagemDTO> _populares = [];

  @observable
  ObservableList<PersonagemDTO> _lastViewed =
      ObservableList<PersonagemDTO>.of([]);

  @observable
  List<PersonagemDTO> _pesquisa = [];

  @computed
  List<PersonagemDTO> get personagens {
    return this._personagens;
  }

  @computed
  List<PersonagemDTO> get populares {
    return this._populares;
  }

  @computed
  List<PersonagemDTO> get ultimos {
    return this._lastViewed;
  }

  @computed
  List<PersonagemDTO> get pesquisados {
    return this._pesquisa;
  }

  @computed
  bool get loading {
    return this.isLoading;
  }

  @action
  setLoad() {
    this.isLoading = !this.isLoading;
    print("setLoad => " + this.isLoading.toString());
  }

  @action
  buscarPersonagensPopulares() {
    this.setLoad();
    _personagemApi
        .getPersonagensByPopularity(offset: this.popularOffset)
        .then((response) {
      print('SUCESSO');
      if (response != null && response['results'] != null) {
        var list = response['results'] as List;
        if (this._populares.isNotEmpty) {
          List<PersonagemDTO> moreHero =
              list.map((i) => PersonagemDTO.map(i)).toList();
          for (var i = 0; i < moreHero.length; i++) {
            this._populares.add(moreHero[i]);
          }
        } else {
          this
              ._populares
              .addAll(list.map((i) => PersonagemDTO.map(i)).toList());
        }
      }
      this.setLoad();
    }).catchError((error) {
      print('ERRO -> $error');
      this.setLoad();
    });
  }

  @action
  buscarPersonagens() {
    print("BuscarPersonagens -> ");
    this.setLoad();
    _personagemApi
        .getPersonagens(page: 0, offset: this.azOffset)
        .then((response) {
      print('SUCESSO');
      if (response != null && response['results'] != null) {
        var list = response['results'] as List;
        if (this._personagens.isNotEmpty) {
          List<PersonagemDTO> moreHero =
              list.map((i) => PersonagemDTO.map(i)).toList();
          for (var i = 0; i < moreHero.length; i++) {
            this._personagens.add(moreHero[i]);
          }
        } else {
          this
              ._personagens
              .addAll(list.map((i) => PersonagemDTO.map(i)).toList());
        }
      }
      this.setLoad();
    }).catchError((error) {
      print('ERRO -> $error');
      this.setLoad();
    });
  }

  @action
  pesquisarPersonagem(String name) {
    this.setLoad();
    _personagemApi.getPersonagensByName(name: name).then((response) {
      print('SUCESSO');
      if (response != null && response['results'] != null) {
        this._pesquisa.clear();
        var list = response['results'] as List;
        this._pesquisa = list.map((i) => PersonagemDTO.map(i)).toList();
      }
      this.setLoad();
    }).catchError((error) {
      print('ERRO -> $error');
      this.setLoad();
    });
  }

  @action
  adicionarUltimo(PersonagemDTO personagemDTO) {
    if (!this._lastViewed.contains(personagemDTO)) {
      _lastViewed.insert(0, personagemDTO);
    }
  }

  @action
  listSort() {
    this._lastViewed.sort((a, b) => a.name.compareTo(b.name));
  }
}
