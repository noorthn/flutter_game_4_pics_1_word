// To parse this JSON data, do
//
//     final word = wordFromJson(jsonString);

import 'dart:convert';

List<Word> wordFromJson(String str) => List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));

String wordToJson(List<Word> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Word {
    Word({
        this.id,
        this.difficult,
        this.letters,
        this.pictures,
    });

    int? id;
    int? difficult;
    List<String>? letters;
    List<Picture>? pictures;

    factory Word.fromJson(Map<String, dynamic> json) => Word(
        id: json["id"],
        difficult: json["difficult"],
        letters: List<String>.from(json["letters"].map((x) => x)),
        pictures: List<Picture>.from(json["pictures"].map((x) => Picture.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "difficult": difficult,
        "letters": List<dynamic>.from(letters!.map((x) => x)),
        "pictures": List<dynamic>.from(pictures!.map((x) => x.toJson())),
    };
}

class Picture {
    Picture({
        this.url,
        this.autor,
    });

    String? url;
    String? autor;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        url: json["url"],
        autor: json["autor"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "autor": autor,
    };
}
