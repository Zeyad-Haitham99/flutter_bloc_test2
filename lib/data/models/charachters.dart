class Charachter {
   int? charId;
  String? name;
  String? birthday;
  List<dynamic>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;

  Charachter(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category,
      this.betterCallSaulAppearance});

  Charachter.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['betterCallSaulAppearance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['occupation'] = this.occupation;
    data['img'] = this.img;
    data['status'] = this.status;
    data['nickname'] = this.nickname;
    data['appearance'] = this.appearance;
    data['portrayed'] = this.portrayed;
    data['category'] = this.category;
    data['betterCallSaulAppearance'] = this.betterCallSaulAppearance;
    return data;
  }
}
