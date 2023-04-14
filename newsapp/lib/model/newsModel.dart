// ignore: file_names
class News {
  late String imageUrl;
  late String title;
  late String description;

  News({
    required this.description,
    required this.imageUrl,
    required this.title,
  });
  static News fromJSON(dynamic map) {
    return News(
        description: map['description']??' ',
        imageUrl: map['urlToImage']??'_',
        title: map['title']??'_');
  }
}
