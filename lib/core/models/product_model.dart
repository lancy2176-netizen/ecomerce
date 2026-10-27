import 'package:equatable/equatable.dart';

class Products extends Equatable {
  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Products copyWith({
    List<Product>? products,
    int? total,
    int? skip,
    int? limit,
  }) {
    return Products(
      products: products ?? this.products,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x)),
            ),
      total: json["total"] ?? 0,
      skip: json["skip"] ?? 0,
      limit: json["limit"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "products": products.map((x) => x?.toJson()).toList(),
    "total": total,
    "skip": skip,
    "limit": limit,
  };

  @override
  String toString() {
    return "$products, $total, $skip, $limit, ";
  }

  @override
  List<Object?> get props => [products, total, skip, limit];
}

class Product extends Equatable {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    // required this.price,
    required this.discountPercentage,
    // required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
    required this.image,
  });

  final int id;
  final String title;
  final String description;
  final String category;
  // final double price;
  final double discountPercentage;
  // final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;
  final String image;

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    // double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
    String? image,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      // price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      // rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      image: image ?? this.image
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    print('Parsing product from JSON: $json'); // Log the JSON being parsed
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      // price: json["price"] ?? 0.0,
      discountPercentage: json["discountPercentage"] ?? 0.0,
      // rating: json["rating"] ?? 0.0,
      stock: json["stock"] ?? 0,
      tags: json["tags"] == null
          ? []
          : List<String>.from(json["tags"]!.map((x) => x)),
      brand: json["brand"] ?? "",
      sku: json["sku"] ?? "",
      weight: json["weight"] ?? 0,
      dimensions: json["dimensions"] == null
          ? null
          : Dimensions.fromJson(json["dimensions"]),
      warrantyInformation: json["warrantyInformation"] ?? "",
      shippingInformation: json["shippingInformation"] ?? "",
      availabilityStatus: json["availabilityStatus"] ?? "",
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      returnPolicy: json["returnPolicy"] ?? "",
      minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      thumbnail: json["thumbnail"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": category,
    // "price": price,
    "discountPercentage": discountPercentage,
    // "rating": rating,
    "stock": stock,
    "tags": tags.map((x) => x).toList(),
    "brand": brand,
    "sku": sku,
    "weight": weight,
    "dimensions": dimensions?.toJson(),
    "warrantyInformation": warrantyInformation,
    "shippingInformation": shippingInformation,
    "availabilityStatus": availabilityStatus,
    "reviews": reviews.map((x) => x?.toJson()).toList(),
    "returnPolicy": returnPolicy,
    "minimumOrderQuantity": minimumOrderQuantity,
    "meta": meta?.toJson(),
    "images": images.map((x) => x).toList(),
    "thumbnail": thumbnail,
    "image": image,
  };

  @override
  String toString() {
    return "$id, $title, $description, $category, $discountPercentage, $stock, $tags, $brand, $sku, $weight, $dimensions, $warrantyInformation, $shippingInformation, $availabilityStatus, $reviews, $returnPolicy, $minimumOrderQuantity, $meta, $images, $thumbnail, ";
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    // price,
    discountPercentage,
    // rating,
    stock,
    tags,
    brand,
    sku,
    weight,
    dimensions,
    warrantyInformation,
    shippingInformation,
    availabilityStatus,
    reviews,
    returnPolicy,
    minimumOrderQuantity,
    meta,
    images,
    thumbnail,
    image,
  ];
}

class Dimensions extends Equatable {
  Dimensions({required this.width, required this.height, required this.depth});

  final double width;
  final double height;
  final double depth;

  Dimensions copyWith({double? width, double? height, double? depth}) {
    return Dimensions(
      width: width ?? this.width,
      height: height ?? this.height,
      depth: depth ?? this.depth,
    );
  }

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json["width"] ?? 0.0,
      height: json["height"] ?? 0.0,
      depth: json["depth"] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "depth": depth,
  };

  @override
  String toString() {
    return "$width, $height, $depth, ";
  }

  @override
  List<Object?> get props => [width, height, depth];
}

class Meta extends Equatable {
  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String barcode;
  final String qrCode;

  Meta copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) {
    return Meta(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      barcode: barcode ?? this.barcode,
      qrCode: qrCode ?? this.qrCode,
    );
  }

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      barcode: json["barcode"] ?? "",
      qrCode: json["qrCode"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "barcode": barcode,
    "qrCode": qrCode,
  };

  @override
  String toString() {
    return "$createdAt, $updatedAt, $barcode, $qrCode, ";
  }

  @override
  List<Object?> get props => [createdAt, updatedAt, barcode, qrCode];
}

class Review extends Equatable {
  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final DateTime? date;
  final String reviewerName;
  final String reviewerEmail;

  Review copyWith({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return Review(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json["rating"] ?? 0,
      comment: json["comment"] ?? "",
      date: DateTime.tryParse(json["date"] ?? ""),
      reviewerName: json["reviewerName"] ?? "",
      reviewerEmail: json["reviewerEmail"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "comment": comment,
    "date": date?.toIso8601String(),
    "reviewerName": reviewerName,
    "reviewerEmail": reviewerEmail,
  };

  @override
  String toString() {
    return "$rating, $comment, $date, $reviewerName, $reviewerEmail, ";
  }

  @override
  List<Object?> get props => [
    rating,
    comment,
    date,
    reviewerName,
    reviewerEmail,
  ];
}
