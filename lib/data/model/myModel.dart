class myModel {
  int? id;
  int? type;
  String? textOne;
  String? txtTwo;
  int? counter;
  int? fav;
  int? reptTime;

  myModel(
      {this.id,
        this.type,
        this.textOne,
        this.txtTwo,
        this.counter,
        this.fav,
        this.reptTime});

  myModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['Type'];
    textOne = json['TextOne'];
    txtTwo = json['TxtTwo'];
    counter = json['Counter'];
    fav = json['Fav'];
    reptTime = json['ReptTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Type'] = this.type;
    data['TextOne'] = this.textOne;
    data['TxtTwo'] = this.txtTwo;
    data['Counter'] = this.counter;
    data['Fav'] = this.fav;
    data['ReptTime'] = this.reptTime;
    return data;
  }
}