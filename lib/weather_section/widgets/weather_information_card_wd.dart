import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherInformationCard extends StatelessWidget {
  final IconData? icon;
  final String? image;
  final String title;
  final String? firstDescription;
  final String? secondDescription;
  final String? value;
  final Color? iconColor;
  const WeatherInformationCard({
    super.key,
    this.icon,
    this.image,
    required this.title,
    this.firstDescription,
    this.secondDescription,
    this.value,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Visibility(
                      visible: image != null,
                      replacement: Visibility(
                        visible: icon != null,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Center(
                            child: Icon(
                              icon,
                              size: 20.0,
                              color: iconColor ?? Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                      child: SizedBox(
                        width: 60.0,
                        height: 60.0,
                        child: CachedNetworkImage(
                          imageUrl: image ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Visibility(
                            visible: firstDescription != null,
                            child: Text(
                              firstDescription ?? '',
                            ),
                          ),
                          Visibility(
                            visible: secondDescription != null,
                            child: Text(
                              secondDescription ?? '',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: value != null,
                child: Text(
                  value ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
