class Actor {
  String? className;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;

  Actor({
    this.className,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        className: json['__className'] as String?,
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as String?,
        castId: json['cast_id'] as int?,
        character: json['character'] as String?,
        creditId: json['credit_id'] as String?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '__className': className,
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
      };
}
