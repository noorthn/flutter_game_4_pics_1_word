// To parse this JSON data, do
//
//     final achievement = achievementFromJson(jsonString);

import 'dart:convert';

List<Achievement> achievementFromJson(String str) => List<Achievement>.from(json.decode(str).map((x) => Achievement.fromJson(x)));

String achievementToJson(List<Achievement> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Achievement {
    Achievement({
        this.icon,
        this.title,
        this.description,
        this.status,
        this.reward,
        this.exp,
        this.steps,
    });

    String? icon;
    String? title;
    String? description;
    bool? status;
    int? reward;
    int? exp;
    Steps? steps;

    factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        icon: json["icon"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        reward: json["reward"],
        exp: json["exp"],
        steps: Steps.fromJson(json["steps"]),
    );

    Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "description": description,
        "status": status,
        "reward": reward,
        "exp": exp,
        "steps": steps!.toJson(),
    };
}

class Steps {
    Steps({
        this.games,
        this.withoutError,
        this.faster,
    });

    int? games;
    int? withoutError;
    Faster? faster;

    factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        games: json["games"] == null ? null : json["games"]!,
        withoutError: json["withoutError"] == null ? null : json["withoutError"]!,
        faster: json["faster"] == null ? null : Faster.fromJson(json["faster"]),
    );

    Map<String, dynamic> toJson() => {
        "games": games == null ? null : games!,
        "withoutError": withoutError == null ? null : withoutError!,
        "faster": faster == null ? null : faster!.toJson(),
    };
}

class Faster {
    Faster({
        this.games,
        this.less,
    });

    int? games;
    int? less;

    factory Faster.fromJson(Map<String, dynamic> json) => Faster(
        games: json["games"],
        less: json["less"],
    );

    Map<String, dynamic> toJson() => {
        "games": games,
        "less": less,
    };
}
