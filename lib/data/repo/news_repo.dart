import 'package:news_app/data/models/Articles.dart';
import 'package:news_app/data/web_services/dio_helper.dart';

class CharacterRepo {
  // Future<List<Character>> getAllCharacter() async {
  //   try {
  //     final characters = await characterWebServices.fetchAllCharacter();
  //     // print(characters);
  //     return characters!
  //         .map((character) => Character.fromJson(character))
  //         .toList();
  //   } catch (e) {
  //     print(e.toString());
  //     // return 'null';
  //     return [];
  //   }
  // }
  // Future<List<Articles>> getData() async {
  //   try {
  //     final result = await DioHelper().getData(url: 'v2/top-headlines', query: {
  //       'country': 'us',
  //       'category': 'business',
  //       'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
  //     });
  //     // print(result.data['articles']);
  //     // return result.data['articles'];
  //     return result!.map((Article) => Articles.fromJson(Article)).toList();
  //   } catch (error) {
  //     return Future.error(error);
  //     // print(error.toString());
  //     // return [];
  //   }
  // }
  // DioHelper().getData(url: 'v2/top-headlines', query: {
  // 'country': 'us',
  // 'category': 'business',
  // 'apiKey': 'cadf9f9b30754500adea102e2eb31c8b'
  // }).then((value) {
  // print(value.data.toString());
  // }).catchError((onError) {
  // // return DioError(onError.);
  // print(onError);
  // });
}
