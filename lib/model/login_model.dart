import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String status;
    String message;
    Data data;

    LoginModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int status;
    int userid;
    String username;
    String useremail;
    String apikey;
    int storeUserStatus;
    int instId;
    List<int> storeId;
    List<int> pageIds;
    List<int> pageoperationIds;

    Data({
        required this.status,
        required this.userid,
        required this.username,
        required this.useremail,
        required this.apikey,
        required this.storeUserStatus,
        required this.instId,
        required this.storeId,
        required this.pageIds,
        required this.pageoperationIds,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["status"],
        userid: json["userid"],
        username: json["username"],
        useremail: json["useremail"],
        apikey: json["apikey"],
        storeUserStatus: json["store_user_status"],
        instId: json["inst_id"],
        storeId: List<int>.from(json["store_id"].map((x) => x)),
        pageIds: List<int>.from(json["page_ids"].map((x) => x)),
        pageoperationIds: List<int>.from(json["pageoperation_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "userid": userid,
        "username": username,
        "useremail": useremail,
        "apikey": apikey,
        "store_user_status": storeUserStatus,
        "inst_id": instId,
        "store_id": List<dynamic>.from(storeId.map((x) => x)),
        "page_ids": List<dynamic>.from(pageIds.map((x) => x)),
        "pageoperation_ids": List<dynamic>.from(pageoperationIds.map((x) => x)),
    };
}
