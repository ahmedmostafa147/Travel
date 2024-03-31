class Way {
  String arrivTime;
  int avTickets;
  String date;
  String depTime;
  String from;
  String id;
  num price;
  String time;
  String to;
  String wayName;
  String? documentId;

  Way(
      {required this.arrivTime,
      required this.avTickets,
      required this.date,
      required this.depTime,
      required this.from,
      required this.id,
      required this.price,
      required this.time,
      required this.to,
      required this.wayName,
      });

  factory Way.fromJson(Map<String, dynamic> json) => Way(
        id: json['id'],
        wayName: json['way'],
        time: json['time'],
        price: json['price'],
        avTickets: json['avTickets'],
        date: json['date'],
        depTime: json['depTime'],
        arrivTime: json['arrivTime'],
        from: json['from'],
        to: json['to'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['arrivTime'] = arrivTime;
    data['avTickets'] = avTickets;
    data['date'] = date;
    data['depTime'] = depTime;
    data['from'] = from;
    data['id'] = id;
    data['price'] = price;
    data['time'] = time;
    data['to'] = to;
    data['way'] = wayName;
    return data;
  }
}
