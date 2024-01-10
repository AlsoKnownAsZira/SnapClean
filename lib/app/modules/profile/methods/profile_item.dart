import 'package:flutter/material.dart';

Widget profileItem(String tittle, {VoidCallback? onTap}) => GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Warna border
            width: 1.0, // Lebar border
          ),
          borderRadius: BorderRadius.circular(8.0), // Radius sudut border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tittle,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
