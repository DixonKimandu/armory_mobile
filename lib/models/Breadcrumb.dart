class Breadcrumb {
  final int id;
  final String type;
  final String title;
  final String link;

  Breadcrumb({
    required this.id,
    required this.type,
    required this.title,
    required this.link,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) {
    return Breadcrumb(
      id: json['id'] as int,
      type: json['type'] as String,
      title: json['title'] as String,
      link: json['link'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'link': link,
    };
  }
}
