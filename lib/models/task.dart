class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;
  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });

  Task copyWith({
    int? id,
    String? title,
    String? note,
    int? isCompleted,
    String? date,
    String? startTime,
    String? endTime,
    int? color,
    int? remind,
    String? repeat,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      remind: remind ?? this.remind,
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, note: $note, isCompleted: $isCompleted, date: $date, startTime: $startTime, endTime: $endTime, color: $color, remind: $remind, repeat: $repeat)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.note == note &&
        other.isCompleted == isCompleted &&
        other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.color == color &&
        other.remind == remind &&
        other.repeat == repeat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        note.hashCode ^
        isCompleted.hashCode ^
        date.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        color.hashCode ^
        remind.hashCode ^
        repeat.hashCode;
  }
}
