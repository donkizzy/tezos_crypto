import 'package:flutter/material.dart';
import 'package:tezos_asessment/core/app_colors.dart';

class CustomField extends StatelessWidget {
  final String title;

  final String hintText;

  final Widget? suffixIcon;

  final TextEditingController? controller;

  const CustomField(
      {super.key, required this.hintText, required this.title, this.suffixIcon,  this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: scorpionGrey,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding:  const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
          decoration: BoxDecoration(
            color: galleryWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration.collapsed(
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(0.32)),
                  ),
                ),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(
                  width: 8,
                ),
                suffixIcon!
              ],
            ],
          ),
        ),
      ],
    );
  }
}
