class ExpenseModel {
  int? id;
  String? title;
  String? desc;
  String? date;

  ExpenseModel({
    this.id,
    this.title,
    this.desc,
    this.date,
  });

  ExpenseModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['date'] = this.date;
    return data;
  }
}
