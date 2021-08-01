import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wallet/models/operation.dart';
import 'package:flutter_wallet/models/transaction.dart';
import 'package:flutter_wallet/widgets/operations_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  List<Operation> operations = [
    new Operation('Bank Withdraw', 'assets/svg/transfer.svg', ''),
    new Operation('Insight Tracking', 'assets/svg/money.svg', ''),
    new Operation('Money Transfer', 'assets/svg/insight.svg', ''),
  ];

  List<Transaction> transactions = [
    new Transaction(
        'Uber Ride', '1st Apr 2020', '-\$35.214', 'assets/images/uber.png'),
    new Transaction(
        'Nike Outlet', '30th Mar 2020', '-\$100.00', 'assets/images/nike.png'),
    new Transaction('Payment Received', '15th Mar 2020', '+\$250.00',
        'assets/images/user_img1.jpg'),
  ];


  List<int> indicators = [0,1,2];

  List<T> mapIndicator<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            //Custom appbar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/menu_icon.svg'),
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('assets/images/user_img1.jpg'))),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Afternoon',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    'Dawit H.',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ],
              ),
            ),



            //Credit Card Section
            Container(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                      height: 190,
                      width: 344,
                      clipBehavior: Clip.hardEdge,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.lightBlue,
                      ),
                      child: Stack(
                        children:<Widget>[
                          Positioned(
                            child: SvgPicture.asset('assets/svg/cardTop.svg',color: Colors.black38,),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: SvgPicture.asset('assets/svg/cardBottom.svg',color: Colors.black38,),
                          ),
                          Positioned(
                            left: 26,
                            top: 48,
                            child: Text( 
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 26,
                            top: 65,
                            child: Text(
                              '**** **** **** 9845',
                              style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                              right: 21,
                              top: 35,
                              child:
                                  Image.asset('assets/images/Mastercard.png')),
                          Positioned(
                            left: 29,
                            bottom: 45,
                            child: Text(
                              'CARD HOLDERNAME',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 21,
                            child: Text(
                              'DAWIT .H',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 21,
                            child: Text(
                              '06-01-2022',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),

            //Dot Indicator
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 13,
                top: 29,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Operations',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  Row(
                    children: mapIndicator<Widget>(
                      indicators,
                      (index, selected) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 9,
                          width: 9,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: current == selected
                                ? Colors.lightBlue
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //Operations Card
            Container(
              height: 125,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16),
                  itemCount: operations.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: OperationCard(
                          operation: operations[index].operation,
                          selectedIcon: operations[index].selectedIcon,
                          unSelectedIcon: operations[index].unSelectedIcon,
                          isSelected: current == index),
                    );
                  }),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 13,
                top: 29,
                right: 10,
              ),
              child: Text(
                'Transactions',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),

            //Transactions Section
            ListView.builder(
                itemCount: transactions.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemBuilder: (context, index) {
                  return Container(
                    height: 76,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(
                        left: 24, top: 12, bottom: 12, right: 22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 5,
                          color: Colors.grey.shade200,
                          offset: Offset(8.0, 8.0),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(transactions[index].img),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transactions[index].transaction,
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Text(
                                  transactions[index].date,
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              transactions[index].amount,
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightBlue),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
