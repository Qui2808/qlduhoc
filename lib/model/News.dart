import 'dart:convert';

class News {
  String? Id;
  String? titlenews;
  String? descriptions;
  String? author;
  String? imageNews;
  String? createDate;

  News({
    this.Id,
    this.titlenews,
    this.descriptions,
    this.author,
    this.imageNews,
    this.createDate
  });

  static List<News> parseList(response) {
    var list = json.decode(response.body) as List;
    return list.map((item) => News.fromJson(item)).toList();
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      Id: json['id'],
      titlenews: json['titlenews'],
      descriptions: json['descriptions'],
      author: json['author'],
      imageNews: json['imageNews'],
      createDate: json['createdAt']// Gán danh sách chương trình
    );
  }
}
