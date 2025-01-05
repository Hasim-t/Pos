
import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
    String status;
    String message;
    List<Datum> data;

    OrderListModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String admissionNo;
    String name;
    String datumClass;
    String photoUrl;
    int orderId;
    String barcode;
    String status;
    DateTime createdAt;
    int price;
    int itemCount;
    String deliveryMethod;
    String studentQr;
    String paymentMode;
    dynamic chequeNumber;
    dynamic chequeDate;
    dynamic nameOfDrawee;
    dynamic draweeAddress;
    dynamic bankName;
    dynamic branchName;
    dynamic cardNumber;
    dynamic nameOnCard;
    int isCancel;
    List<Item> items;

    Datum({
        required this.id,
        required this.admissionNo,
        required this.name,
        required this.datumClass,
        required this.photoUrl,
        required this.orderId,
        required this.barcode,
        required this.status,
        required this.createdAt,
        required this.price,
        required this.itemCount,
        required this.deliveryMethod,
        required this.studentQr,
        required this.paymentMode,
        required this.chequeNumber,
        required this.chequeDate,
        required this.nameOfDrawee,
        required this.draweeAddress,
        required this.bankName,
        required this.branchName,
        required this.cardNumber,
        required this.nameOnCard,
        required this.isCancel,
        required this.items,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        admissionNo: json["admission_no"],
        name: json["name"],
        datumClass: json["Class"],
        photoUrl: json["photo_url"],
        orderId: json["order_id"],
        barcode: json["barcode"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        price: json["price"],
        itemCount: json["item_count"],
        deliveryMethod: json["delivery_method"],
        studentQr: json["student_qr"],
        paymentMode: json["payment_mode"],
        chequeNumber: json["cheque_number"],
        chequeDate: json["cheque_date"],
        nameOfDrawee: json["name_of_drawee"],
        draweeAddress: json["drawee_address"],
        bankName: json["bank_name"],
        branchName: json["branch_name"],
        cardNumber: json["card_number"],
        nameOnCard: json["name_on_card"],
        isCancel: json["is_cancel"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admission_no": admissionNo,
        "name": name,
        "Class": datumClass,
        "photo_url": photoUrl,
        "order_id": orderId,
        "barcode": barcode,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "price": price,
        "item_count": itemCount,
        "delivery_method": deliveryMethod,
        "student_qr": studentQr,
        "payment_mode": paymentMode,
        "cheque_number": chequeNumber,
        "cheque_date": chequeDate,
        "name_of_drawee": nameOfDrawee,
        "drawee_address": draweeAddress,
        "bank_name": bankName,
        "branch_name": branchName,
        "card_number": cardNumber,
        "name_on_card": nameOnCard,
        "is_cancel": isCancel,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    int itemId;
    int quantity;
    int price;
    String itemName;
    int availableStock;
    String status;
    DateTime createdAt;
    String countOfPending;
    String deliveryMethod;
    String size;

    Item({
        required this.itemId,
        required this.quantity,
        required this.price,
        required this.itemName,
        required this.availableStock,
        required this.status,
        required this.createdAt,
        required this.countOfPending,
        required this.deliveryMethod,
        required this.size,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        quantity: json["quantity"],
        price: json["price"],
        itemName: json["item_name"],
        availableStock: json["available_stock"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        countOfPending: json["count_of_pending"],
        deliveryMethod: json["delivery_method"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "quantity": quantity,
        "price": price,
        "item_name": itemName,
        "available_stock": availableStock,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "count_of_pending": countOfPending,
        "delivery_method": deliveryMethod,
        "size": size,
    };
}
