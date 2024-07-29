class Category {
  final int id;
  final String name;
  final String? image;
  final DateTime? created_at;
  final DateTime? updated_at;
  final DateTime? deleted_at;
  final int status;
  final String slug;
  final String? description;
  final int order;
  final int important;
  final String type;
  final int width;
  final String? mobileImage;
  final String? short_display;

  Category({
    required this.name,
    required this.description,
    required this.id,
    required this.status,
    this.image,
    required this.order,
    required this.important,
    required this.type,
    required this.width,
    this.mobileImage,
    this.short_display,
    this.deleted_at,
    this.created_at,
    this.updated_at,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      description: json['description'],
      id: json['id'],
      status: json['status'],
      deleted_at: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      created_at: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      slug: json['slug'],
      order: json['order'],
      important: json['important'],
      type: json['type'],
      width: json['width'],
      mobileImage: json['mobileImage'] as String?,
      short_display: json['short_display'] as String?,
      image: json['image'] as String?,
    );
  }
}
