class Media {
  final int id;
  final int main;
  final String path;
  final String type;
  final int? product_id;
  final DateTime? created_at;
  final DateTime? updated_at;
  final int? realisation_id;

  Media({
    required this.id,
    this.product_id,
    this.created_at,
    this.updated_at,
    this.realisation_id,
    required this.main,
    required this.path,
    required this.type,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      product_id: json['product_id'] as int?,
      main: json['main'],
      path: json['path'],
      type: json['type'],
      realisation_id: json['realisation_id'] as int?,
      id: json['id'],
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}
