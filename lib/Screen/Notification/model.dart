
import 'dart:convert';

Notifications notificationsFromJson(String str) => Notifications.fromJson(json.decode(str));

String notificationsToJson(Notifications data) => json.encode(data.toJson());

class Notifications {
    Notifications({
        this.status,
        this.data,
    });

    String? status;
    List<Datum>? data;

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.description,
        this.dateCreated,
        this.status,
        this.userId,
    });

    int? id;
    String? title;
    String? description;
    DateTime? dateCreated;
    String? status;
    int? userId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dateCreated: DateTime.parse(json["date_created"]),
        status: json["status"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date_created": dateCreated.toString(),
        "status": status,
        "user_id": userId,
    };
}
