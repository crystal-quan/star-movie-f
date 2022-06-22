class PhotoList {
  List<Backdrops>? backdrops;
  List<Posters>? posters;

  PhotoList({this.backdrops, this.posters});

  PhotoList.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <Backdrops>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(new Backdrops.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <Posters>[];
      json['posters'].forEach((v) {
        posters!.add(new Posters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.backdrops != null) {
      data['backdrops'] = this.backdrops!.map((v) => v.toJson()).toList();
    }
    if (this.posters != null) {
      data['posters'] = this.posters!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['file_path'] = this.filePath;
    data['height'] = this.height;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['width'] = this.width;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['file_path'] = this.filePath;
    data['height'] = this.height;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['width'] = this.width;
    return data;
  }
}