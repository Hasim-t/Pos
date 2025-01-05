// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
    String status;
    String message;
    Data data;

    StudentModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
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
    List<User> user;
    Cart cart;
    List<KitDatum> kitData;

    Data({
        required this.user,
        required this.cart,
        required this.kitData,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
        cart: Cart.fromJson(json["cart"]),
        kitData: List<KitDatum>.from(json["kitData"].map((x) => KitDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
        "cart": cart.toJson(),
        "kitData": List<dynamic>.from(kitData.map((x) => x.toJson())),
    };
}

class Cart {
    String message;

    Cart({
        required this.message,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}

class KitDatum {
    dynamic kitId;
    dynamic barcode;
    dynamic totalQty;
    dynamic finalTotal;

    KitDatum({
        this.kitId,
        this.barcode,
        this.totalQty,
        this.finalTotal,
    });

    factory KitDatum.fromJson(Map<String, dynamic> json) => KitDatum(
        kitId: json["kit_id"],
        barcode: json["barcode"],
        totalQty: json["total_qty"],
        finalTotal: json["final_total"],
    );

    Map<String, dynamic> toJson() => {
        "kit_id": kitId,
        "barcode": barcode,
        "total_qty": totalQty,
        "final_total": finalTotal,
    };
}

class User {
    String id;
    String admissionNo;
    String name;
    String userClass;
    String phone;
    String fatherName;
    String photoUrl;
    String address;
    String description;
    dynamic walletBalance;
    String paymentMethod;
    String deliveryMethod;

    User({
        required this.id,
        required this.admissionNo,
        required this.name,
        required this.userClass,
        required this.phone,
        required this.fatherName,
        required this.photoUrl,
        required this.address,
        required this.description,
        this.walletBalance,
        required this.paymentMethod,
        required this.deliveryMethod,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        admissionNo: json["admission_no"],
        name: json["name"],
        userClass: json["Class"],
        phone: json["Phone"],
        fatherName: json["Father_Name"],
        photoUrl: json["photo_url"],
        address: json["Address"],
        description: json["Description"],
        walletBalance: json["wallet_balance"],
        paymentMethod: json["payment_method"],
        deliveryMethod: json["delivery_method"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admission_no": admissionNo,
        "name": name,
        "Class": userClass,
        "Phone": phone,
        "Father_Name": fatherName,
        "photo_url": photoUrl,
        "Address": address,
        "Description": description,
        "wallet_balance": walletBalance,
        "payment_method": paymentMethod,
        "delivery_method": deliveryMethod,
    };
}