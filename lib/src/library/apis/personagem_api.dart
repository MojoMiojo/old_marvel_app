import 'package:flutter/material.dart';

import 'utils/base_api.dart';
import 'utils/network_api.dart';

class PersonagemApi extends BaseApi {
  Future<dynamic> getPersonagens({
    @required int page,
    @required int offset,
  }) {
    return this
        .request(HttpMethod.GET, 'characters?limit=20&offset=$offset')
        .then((response) {
      return response;
    }).catchError((error) {
      throw (error);
    });
  }

  Future<dynamic> getPersonagemById(int id) {
    return this.request(HttpMethod.GET, 'characters/$id').then((response) {
      return response;
    }).catchError((error) {
      throw (error);
    });
  }

  Future<dynamic> getPersonagensByName({
    @required String name,
  }) {
    return this
        .request(HttpMethod.GET, 'characters?nameStartsWith=$name')
        .then((response) {
      return response;
    }).catchError((error) {
      throw (error);
    });
  }

  Future<dynamic> getPersonagensByPopularity({
    @required offset,
  }) {
    return this
        .request(
            HttpMethod.GET, 'events/310/characters?limit=20&offset=$offset')
        .then((response) {
      return response;
    }).catchError((error) {
      throw (error);
    });
  }
}
