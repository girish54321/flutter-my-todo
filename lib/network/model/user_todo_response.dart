///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UserTodoResponseTodoFiles {
/*
{
  "fileId": "d0a6efa7-845b-4d88-87a3-78cb7cc83ff5",
  "fileName": "file/1735907829483-58662892.png",
  "fileSize": "330262",
  "type": "text/plain",
  "createdAt": "2025-01-03T12:37:09.538Z",
  "updatedAt": "2025-01-03T12:37:09.538Z",
  "toDoId": "6ebf9cdd-391a-4c3a-a4a5-354efa106b8d",
  "userId": "f272e7ef-310e-4657-b81b-49e5d5901253"
} 
*/

  String? fileId;
  String? fileName;
  String? fileSize;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? toDoId;
  String? userId;

  UserTodoResponseTodoFiles({
    this.fileId,
    this.fileName,
    this.fileSize,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.toDoId,
    this.userId,
  });
  UserTodoResponseTodoFiles.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId']?.toString();
    fileName = json['fileName']?.toString();
    fileSize = json['fileSize']?.toString();
    type = json['type']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    toDoId = json['toDoId']?.toString();
    userId = json['userId']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fileId'] = fileId;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['toDoId'] = toDoId;
    data['userId'] = userId;
    return data;
  }
}

class UserTodoResponseTodo {
/*
{
  "toDoId": "6ebf9cdd-391a-4c3a-a4a5-354efa106b8d",
  "title": "df",
  "body": "df",
  "state": "pending",
  "createdAt": "2025-01-03T12:37:09.536Z",
  "updatedAt": "2025-01-03T12:37:09.536Z",
  "userId": "f272e7ef-310e-4657-b81b-49e5d5901253",
  "files": [
    {
      "fileId": "d0a6efa7-845b-4d88-87a3-78cb7cc83ff5",
      "fileName": "file/1735907829483-58662892.png",
      "fileSize": "330262",
      "type": "text/plain",
      "createdAt": "2025-01-03T12:37:09.538Z",
      "updatedAt": "2025-01-03T12:37:09.538Z",
      "toDoId": "6ebf9cdd-391a-4c3a-a4a5-354efa106b8d",
      "userId": "f272e7ef-310e-4657-b81b-49e5d5901253"
    }
  ]
} 
*/

  String? toDoId;
  String? title;
  String? body;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? userId;
  List<UserTodoResponseTodoFiles?>? files;

  UserTodoResponseTodo({
    this.toDoId,
    this.title,
    this.body,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.files,
  });
  UserTodoResponseTodo.fromJson(Map<String, dynamic> json) {
    toDoId = json['toDoId']?.toString();
    title = json['title']?.toString();
    body = json['body']?.toString();
    state = json['state']?.toString();
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    userId = json['userId']?.toString();
    if (json['files'] != null) {
      final v = json['files'];
      final arr0 = <UserTodoResponseTodoFiles>[];
      v.forEach((v) {
        arr0.add(UserTodoResponseTodoFiles.fromJson(v));
      });
      files = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['toDoId'] = toDoId;
    data['title'] = title;
    data['body'] = body;
    data['state'] = state;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['userId'] = userId;
    if (files != null) {
      final v = files;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['files'] = arr0;
    }
    return data;
  }
}

class UserTodoResponse {
/*
{
  "total_pages": 11,
  "total": 101,
  "per_page": 10,
  "page": 1,
  "todo": [
    {
      "toDoId": "6ebf9cdd-391a-4c3a-a4a5-354efa106b8d",
      "title": "df",
      "body": "df",
      "state": "pending",
      "createdAt": "2025-01-03T12:37:09.536Z",
      "updatedAt": "2025-01-03T12:37:09.536Z",
      "userId": "f272e7ef-310e-4657-b81b-49e5d5901253",
      "files": [
        {
          "fileId": "d0a6efa7-845b-4d88-87a3-78cb7cc83ff5",
          "fileName": "file/1735907829483-58662892.png",
          "fileSize": "330262",
          "type": "text/plain",
          "createdAt": "2025-01-03T12:37:09.538Z",
          "updatedAt": "2025-01-03T12:37:09.538Z",
          "toDoId": "6ebf9cdd-391a-4c3a-a4a5-354efa106b8d",
          "userId": "f272e7ef-310e-4657-b81b-49e5d5901253"
        }
      ]
    }
  ]
} 
*/

  int? totalPages;
  int? total;
  int? perPage;
  int? page;
  List<UserTodoResponseTodo?>? todo;

  UserTodoResponse({
    this.totalPages,
    this.total,
    this.perPage,
    this.page,
    this.todo,
  });
  UserTodoResponse.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages']?.toInt();
    total = json['total']?.toInt();
    perPage = json['per_page']?.toInt();
    page = json['page']?.toInt();
    if (json['todo'] != null) {
      final v = json['todo'];
      final arr0 = <UserTodoResponseTodo>[];
      v.forEach((v) {
        arr0.add(UserTodoResponseTodo.fromJson(v));
      });
      todo = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_pages'] = totalPages;
    data['total'] = total;
    data['per_page'] = perPage;
    data['page'] = page;
    if (todo != null) {
      final v = todo;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['todo'] = arr0;
    }
    return data;
  }
}

class TodoDetailsModal {
/*
{
  "todo": {
    "toDoId": "56bd3a55-0b0d-43ed-987d-e0317aee0fdb",
    "title": "how is this",
    "body": "can I go",
    "state": "pending",
    "createdAt": "2025-01-11T10:20:19.196Z",
    "updatedAt": "2025-01-11T12:30:54.612Z",
    "userId": "1c250a77-8bbc-49b6-b4e5-a61b53300997"
  }
} 
*/

  UserTodoResponseTodo? todo;

  TodoDetailsModal({
    this.todo,
  });
  TodoDetailsModal.fromJson(Map<String, dynamic> json) {
    todo = (json['todo'] != null)
        ? UserTodoResponseTodo.fromJson(json['todo'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (todo != null) {
      data['todo'] = todo!.toJson();
    }
    return data;
  }
}
