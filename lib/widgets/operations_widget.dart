import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unSelectedIcon;
  final bool isSelected;
  OperationCard(
      {required this.operation,
      required this.selectedIcon,
      required this.unSelectedIcon,
      required this.isSelected});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 125,
      height: 125,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(8.0, 8.0),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          color: widget.isSelected ? Colors.lightBlue : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.selectedIcon,
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.operation,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: widget.isSelected ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
