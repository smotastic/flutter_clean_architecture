import 'package:flutter_clean_architecture/core/data/data_sources/dog_api_helper.dart';
import 'package:flutter_clean_architecture/features/dogcarousel/data/models/dog_entry_model.dart';

import 'package:flutter_clean_architecture/core/domain/failure.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/features/dogcarousel/domain/dog_carousel_failures.dart';
import 'package:injectable/injectable.dart';

import 'dog_carousel_ds_remote.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

@LazySingleton(as: DogCarouselDatasourceRemote)
class DogCarouselDatasourceRemoteRest extends DogCarouselDatasourceRemote {
  @override
  Future<Either<Failure, DogEntryModel>> fetchRandomDog() async {
    var url = DogApi.url('/v1/images/search');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      var randomDogJson = jsonResponse[0] as Map<String, dynamic>;
      return Right(DogEntryModel.fromJson(randomDogJson));
    } else {
      return Left(DogCarouselFailures.REMOTE_CALL_FAILED);
    }
    //return Right(DogModel(
    //   "Shiba Inu", "https://cdn2.thedogapi.com/images/tYnqlqNkz.jpg"));
  }
}
