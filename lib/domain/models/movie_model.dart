import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MovieModel {
  String video_id;
  String title;
  String description;
  String banner;
  String sponsor;
  String file_upload;

  MovieModel({
    required this.video_id,
    required this.title,
    required this.description,
    required this.banner,
    required this.sponsor,
    required this.file_upload,
  });

  MovieModel copyWith({
    String? video_id,
    String? title,
    String? description,
    String? banner,
    String? sponsor,
    String? file_upload,
  }) {
    return MovieModel(
      video_id: video_id ?? this.video_id,
      title: title ?? this.title,
      description: description ?? this.description,
      banner: banner ?? this.banner,
      sponsor: sponsor ?? this.sponsor,
      file_upload: file_upload ?? this.file_upload,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'video_id': video_id,
      'title': title,
      'description': description,
      'banner': banner,
      'sponsor': sponsor,
      'file_upload': file_upload,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      video_id: map['video_id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      banner: map['banner'] as String,
      sponsor: map['sponsor'] as String,
      file_upload: map['file_upload'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieModel(video_id: $video_id, title: $title, description: $description, banner: $banner, sponsor: $sponsor, file_upload: $file_upload)';
  }

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.video_id == video_id &&
        other.title == title &&
        other.description == description &&
        other.banner == banner &&
        other.sponsor == sponsor &&
        other.file_upload == file_upload;
  }

  @override
  int get hashCode {
    return video_id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        banner.hashCode ^
        sponsor.hashCode ^
        file_upload.hashCode;
  }
}
