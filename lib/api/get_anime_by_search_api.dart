import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/config/app_config.dart';
import '/models/anime.dart';
import '/models/anime_info.dart';

Future<Iterable<Anime>> getAnimesbySearchApi({
  required String query,
}) async {
  final baseUrl = "https://api.myanimelist.net/v2/anime?q=$query&limit=10";
  

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {
      'X-MAL-CLIENT-ID': clientId,
    },
  );

  if (response.statusCode == 200) {
    // Successful response
    final Map<String, dynamic> data = json.decode(response.body);
    AnimeInfo animeInfo = AnimeInfo.fromJson(data);
    Iterable<Anime> animes = animeInfo.animes;

    return animes;
  } else {
    // Error handling
    debugPrint("Error: ${response.statusCode}");
    debugPrint("Body: ${response.body}");
    throw Exception("Failed to get data!");
  }
}