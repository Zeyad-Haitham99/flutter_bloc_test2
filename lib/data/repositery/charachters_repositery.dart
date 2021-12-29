import 'package:flutter_bloc_test2/data/models/charachters.dart';
import 'package:flutter_bloc_test2/data/web_services/charachters_response.dart';

class CharachterRepositery {
  final CharachterResponse charachterResponse;

  CharachterRepositery(this.charachterResponse);
  Future<List<Charachter>> getAllCharachter() async {
     final charachters = await charachterResponse.getAllCharachter();
    return charachters!
        .map((charachter) => Charachter.fromJson(charachter))
        .toList();
  }
}
