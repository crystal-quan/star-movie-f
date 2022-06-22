class PhotoList {
  List<Backdrops>? backdrops;
  List<Posters>? posters;

  PhotoList({this.backdrops, this.posters});

  PhotoList.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <Backdrops>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(Backdrops.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <Posters>[];
      json['posters'].forEach((v) {
        posters!.add(Posters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toJson()).toList();
    }
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Backdrops {
  double? aspectRatio;
  String? filePath;
  int? height;
  double? voteAverage;
  int? voteCount;
  int? width;

  Backdrops(
      {this.aspectRatio,
        this.filePath,
        this.height,
        this.voteAverage,
        this.voteCount,
        this.width});

  Backdrops.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio']?.toDouble() ?? 0.0;
    filePath = json['file_path'];
    height = json['height'];
    voteAverage = json['vote_average']?.toDouble() ?? 0.0;
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['file_path'] = filePath;
    data['height'] = height;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}

class Posters {
  double? aspectRatio;
  String? filePath;
  int? height;
  double? voteAverage;
  int? voteCount;
  int? width;

  Posters(
      {this.aspectRatio,
        this.filePath,
        this.height,
        this.voteAverage,
        this.voteCount,
        this.width});

  Posters.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio']?.toDouble() ?? 0.0;
    filePath = json['file_path'];
    height = json['height'];
    voteAverage = json['vote_average']?.toDouble() ?? 0.0;
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['file_path'] = filePath;
    data['height'] = height;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}