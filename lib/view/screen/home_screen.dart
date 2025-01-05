import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posdelivery/model/order_list_model.dart';
import 'package:posdelivery/service/login_service.dart';
import 'package:posdelivery/view/screen/login_page.dart';
import 'package:posdelivery/view/screen/students_detials_screen.dart';
import 'package:posdelivery/widgets/appbar.dart';
import 'package:posdelivery/widgets/bottomsheet.dart';
import 'package:posdelivery/widgets/custom_textwidget.dart';
import 'package:posdelivery/widgets/customtopbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<OrderListModel> orderListFuture;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    orderListFuture = getOrderListData();
  }

  Future<OrderListModel> getOrderListData() async {
    await getorderlist();
    return orderListModel!;
  }

  @override
  Widget build(BuildContext context) {
    final double screenhight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFF1F1F1F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              'assets/LogoPos1.png',
              height: 40,
              width: 40,
            ),
            const Column(
              children: [
                CustomTextwidget(
                  text: 'Benchmark',
                  size: 12,
                ),
                CustomTextwidget(text: 'POS'),
              ],
            )
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/LogoPos1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      CustomTextwidget(
                                        text: 'Benchmark',
                                        size: 12,
                                        color: Colors.black,
                                      ),
                                      CustomTextwidget(
                                        text: 'POS',
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomAppBarRight(),

                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 10),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      logout();
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                        Text(
                                          'Log Out',
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        )
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: CustomAppBar())
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Color(0XFFE7E9FD),
            borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(40), topStart: Radius.circular(40))),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Customtopbutton(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<OrderListModel>(
                  future: orderListFuture,
                  builder: (context, snapshort) {
                    if (snapshort.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshort.hasError) {
                      return const GetSnackBar(
                        message: 'The fetching is error',
                      );
                    } else if (snapshort.hasData) {
                      final orders = snapshort.data!.data;
                      return ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 15, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return StudentsDetailsScreen(
                                      studentData: order,
                                    );
                                  }));
                                  getstudentdeteals(order.id);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  height: screenhight * 0.11,
                                  width: screenwidth * 0.86,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          order.photoUrl,
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextwidget(
                                              text: order.name,
                                              color: Colors.black,
                                              size: 16,
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                CustomTextwidget(
                                                  text:
                                                      'Class ${order.datumClass}',
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 20),
                                                CustomTextwidget(
                                                  text:
                                                      'Item: ${order.itemCount}',
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomTextwidget(
                                            text: 'Order ID ${order.id}',
                                            color: Colors.black54,
                                            size: 12,
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                              color: const Color(0XFFD9E7FD),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: const CustomTextwidget(
                                              text: 'Ready for Delivery',
                                              color: Colors.green,
                                              size: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('No Data Avalable'),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('isLogin', false);
    await pref.setString('api_key', '');
    Get.off(const LoginPage());
  }
}
