import 'package:plv/common/model/media.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String? description_general;
  final int start_price;
  final int? rating;
  final int status;
  final DateTime? deleted_at;
  final DateTime? created_at;
  final DateTime? updated_at;
  final String? fich;
  final String slug;
  final int? orderCount;
  final String? trace;
  final int disponible;
  final int duree_livraison;
  final int? category_id;
  final int? sub_category_id;
  final int obg_file;
  final int? start_price_fr;

  final Media media;

  Product({
    required this.name,
    required this.description,
    required this.id,
    this.description_general,
    required this.start_price,
    this.rating,
    required this.status,
    this.deleted_at,
    this.created_at,
    this.updated_at,
    this.fich,
    required this.slug,
    this.orderCount,
    this.trace,
    required this.disponible,
    required this.duree_livraison,
    this.category_id,
    this.sub_category_id,
    required this.obg_file,
    this.start_price_fr,
    required this.media,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      id: json['id'],
      description_general: json['description_general'] as String?,
      start_price: json['start_price'],
      fich: json['fich'] as String?,
      rating: json['rating'] as int?,
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
      orderCount: json['orderCount'] as int?,
      trace: json['trace'] as String?,
      disponible: json['disponible'],
      duree_livraison: json['duree_livraison'],
      category_id: json['category_id'] as int?,
      sub_category_id: json['sub_category_id'] as int?,
      obg_file: json['obg_file'],
      start_price_fr: json['start_price_fr'] as int?,
      media: Media.fromJson(json['media']),
    );
  }
}
