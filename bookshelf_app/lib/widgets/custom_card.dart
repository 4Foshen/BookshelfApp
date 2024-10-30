import 'package:bookshelf_app/system/app_colors.dart';
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  final String assetImagePath;
  final String dateText;
  final String eventText;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final VoidCallback onIconPressed;

  const EventCardWidget({
    Key? key,
    required this.assetImagePath,
    required this.dateText,
    required this.eventText,
    required this.buttonText,
    required this.onButtonPressed,
    required this.onIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        image: DecorationImage(
          image: AssetImage(assetImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff2F2F2F).withOpacity(0.6),
              borderRadius: BorderRadius.circular(17.0),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              dateText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Container(
                width: 280,
                child: Text(
                  eventText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: onIconPressed,
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
