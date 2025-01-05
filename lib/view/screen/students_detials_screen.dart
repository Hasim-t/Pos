import 'dart:developer';

import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/model/order_list_model.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:posdelivery/widgets/alert_dialog.dart';

class StudentsDetailsScreen extends StatefulWidget {
  const StudentsDetailsScreen({
    super.key,
    required this.studentData,
  });
  final Datum studentData;

  @override
  State<StudentsDetailsScreen> createState() => _StudentsDetailsScreenState();
}

class _StudentsDetailsScreenState extends State<StudentsDetailsScreen> {
  bool isExpanded = false;
  Future<String?> scanPackage() async {
      try {
        // Start the scanner and get the result
        final result = await BarcodeScanner.scan();

        if (result != null) {
          setState(() {
            qrdata = result
                .rawContent; 
          });
           if (qrdata == widget.studentData.studentQr) {
            showDialog(
                
                context: context,
                builder: (BuildContext context) {
                  return  AlertDialogCustom(studentData: widget.studentData,);
                });
          }else{
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return  AlertDialogCustomFailed(
                    onscanfuntion:scanPackage,
                  );
                });
          }
    
          log(qrdata.toString());

          

          return qrdata;
        } else {
       
           showDialog(
                context: context,
                builder: (BuildContext context) {
                  return  AlertDialogCustomFailed(
                    onscanfuntion: scanPackage,
                  );
                });
        }
      } catch (e) {
        // Show an error snackbar if something goes wrong
        Get.snackbar(
          'Scan Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
        );
      }
      return null;
    }
  String? qrdata;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      backgroundColor: const Color(0XFFE7E9FD),
      appBar: AppBar(
        centerTitle: true,
        title: Text('#${widget.studentData.orderId}'),
        backgroundColor: Colors.transparent,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                ),
                child: const Center(child: Icon(Icons.arrow_back_ios_new)),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(widget.studentData.photoUrl),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.studentData.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Class ${widget.studentData.datumClass}',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: isExpanded
                                ? Column(
                                    children: [
                                      const Divider(height: 1),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.phone,
                                                    color: Colors.blue,
                                                    size: 20),
                                                const SizedBox(width: 12),
                                                Text(
                                                  studentModel!
                                                      .data.user[0].phone
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              children: [
                                                const Icon(Icons.person_outline,
                                                    color: Colors.blue,
                                                    size: 20),
                                                const SizedBox(width: 12),
                                                Text(
                                                  studentModel!
                                                      .data.user[0].fatherName,
                                                  style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.blue,
                                                    size: 20),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    studentModel!
                                                        .data.user[0].address
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.grey[800],
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Delivery Items ${widget.studentData.itemCount - 1}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.studentData.items.length,
                      itemBuilder: (context, index) {
                        final item = widget.studentData.items[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.book_outlined),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.itemName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          item.quantity.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: item.status == 'packed'
                                            ? Colors.green[50]
                                            : Colors.orange[50],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        item.status.toUpperCase(),
                                        style: TextStyle(
                                          color: item.status == 'packed'
                                              ? Colors.green
                                              : Colors.orange,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  scanPackage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Scan the Package',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
