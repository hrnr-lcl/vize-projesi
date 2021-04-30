import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_list1/item.dart';

class ItemService {
  final String _serviceUrl = "https://raw.githubusercontent.com/hrnr-lcl/hira/f347849fc89613f40e6a915913815622d0e93751/shopping%20list.txt";

  Future<List<Item>> fetchItems() async {

    final response = await http.get(_serviceUrl);
    if (response.statusCode == 200) {
      Iterable items = json.decode(response.body);
      return items.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception("something went wrong");
    }
  }

  Future<void> addToArchive() async {

    final response = await http.post(_serviceUrl);
    if (response.statusCode != 201) {
      throw Exception("something went wrong");
    }
  }

  Future<List<Item>> fetchArchive(int take, int skip)async{
    var parameters = {
     "take":take.toString(),
     "skip":skip.toString()
    };
    var uri = Uri.https(_serviceUrl, "history",parameters);
     final response = await http.get(uri);
    if (response.statusCode == 200) {
      Iterable items = json.decode(response.body);
      return items.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception("something went wrong");
    }

  }
  Future<Item> addItem(Item item) async {

    final response = await http.post(_serviceUrl, headers: {
      "content-type": "application/json"
    }, body: item.toJson());
    if (response.statusCode == 201) {
      Map item = json.decode(response.body);
      return Item.fromJson(item);
    } else {
      throw Exception("something went wrong");
    }
  }

    Future<Item> editItem(Item item)async{
    final response = await http.patch("${_serviceUrl}${item.id}",headers: {
      "content-type":"application/json"
    } , body: item.toJson());
    if (response.statusCode == 200) {
      Map item = json.decode(response.body);
      return Item.fromJson(item);
    } else {
      throw Exception("something went wrong");
    }


  }
}
