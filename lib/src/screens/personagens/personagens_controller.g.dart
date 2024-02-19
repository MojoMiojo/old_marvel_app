// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personagens_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonagensController on _PersonagensController, Store {
  Computed<List<PersonagemDTO>> _$personagensComputed;

  @override
  List<PersonagemDTO> get personagens => (_$personagensComputed ??=
          Computed<List<PersonagemDTO>>(() => super.personagens,
              name: '_PersonagensController.personagens'))
      .value;
  Computed<List<PersonagemDTO>> _$popularesComputed;

  @override
  List<PersonagemDTO> get populares => (_$popularesComputed ??=
          Computed<List<PersonagemDTO>>(() => super.populares,
              name: '_PersonagensController.populares'))
      .value;
  Computed<List<PersonagemDTO>> _$ultimosComputed;

  @override
  List<PersonagemDTO> get ultimos =>
      (_$ultimosComputed ??= Computed<List<PersonagemDTO>>(() => super.ultimos,
              name: '_PersonagensController.ultimos'))
          .value;
  Computed<List<PersonagemDTO>> _$pesquisadosComputed;

  @override
  List<PersonagemDTO> get pesquisados => (_$pesquisadosComputed ??=
          Computed<List<PersonagemDTO>>(() => super.pesquisados,
              name: '_PersonagensController.pesquisados'))
      .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_PersonagensController.loading'))
      .value;

  final _$isLoadingAtom = Atom(name: '_PersonagensController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_personagensAtom = Atom(name: '_PersonagensController._personagens');

  @override
  ObservableList<PersonagemDTO> get _personagens {
    _$_personagensAtom.reportRead();
    return super._personagens;
  }

  @override
  set _personagens(ObservableList<PersonagemDTO> value) {
    _$_personagensAtom.reportWrite(value, super._personagens, () {
      super._personagens = value;
    });
  }

  final _$_popularesAtom = Atom(name: '_PersonagensController._populares');

  @override
  List<PersonagemDTO> get _populares {
    _$_popularesAtom.reportRead();
    return super._populares;
  }

  @override
  set _populares(List<PersonagemDTO> value) {
    _$_popularesAtom.reportWrite(value, super._populares, () {
      super._populares = value;
    });
  }

  final _$_lastViewedAtom = Atom(name: '_PersonagensController._lastViewed');

  @override
  ObservableList<PersonagemDTO> get _lastViewed {
    _$_lastViewedAtom.reportRead();
    return super._lastViewed;
  }

  @override
  set _lastViewed(ObservableList<PersonagemDTO> value) {
    _$_lastViewedAtom.reportWrite(value, super._lastViewed, () {
      super._lastViewed = value;
    });
  }

  final _$_pesquisaAtom = Atom(name: '_PersonagensController._pesquisa');

  @override
  List<PersonagemDTO> get _pesquisa {
    _$_pesquisaAtom.reportRead();
    return super._pesquisa;
  }

  @override
  set _pesquisa(List<PersonagemDTO> value) {
    _$_pesquisaAtom.reportWrite(value, super._pesquisa, () {
      super._pesquisa = value;
    });
  }

  final _$_PersonagensControllerActionController =
      ActionController(name: '_PersonagensController');

  @override
  dynamic setLoad() {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.setLoad');
    try {
      return super.setLoad();
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscarPersonagensPopulares() {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.buscarPersonagensPopulares');
    try {
      return super.buscarPersonagensPopulares();
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscarPersonagens() {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.buscarPersonagens');
    try {
      return super.buscarPersonagens();
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pesquisarPersonagem(String name) {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.pesquisarPersonagem');
    try {
      return super.pesquisarPersonagem(name);
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adicionarUltimo(PersonagemDTO personagemDTO) {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.adicionarUltimo');
    try {
      return super.adicionarUltimo(personagemDTO);
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic listSort() {
    final _$actionInfo = _$_PersonagensControllerActionController.startAction(
        name: '_PersonagensController.listSort');
    try {
      return super.listSort();
    } finally {
      _$_PersonagensControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
personagens: ${personagens},
populares: ${populares},
ultimos: ${ultimos},
pesquisados: ${pesquisados},
loading: ${loading}
    ''';
  }
}
