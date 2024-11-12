import 'package:bookshelf_app/system/app_colors.dart';
import 'package:bookshelf_app/system/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventInfo extends StatefulWidget {
  final Event event;

  const EventInfo({required this.event, super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left_rounded,
              size: 40,
              color: AppColors.primaryColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //NAME AND BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "События",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 58,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        //OPEN MY EVENTS
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: AppColors.secondaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("assets/svg/events.svg"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Мои мероприятия",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //IMAGE
            Center(
              child: Container(
                width: 350,
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.0),
                  image: DecorationImage(
                    image: AssetImage(widget.event.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.event.eventName,
                style: TextStyle(
                  color: Color(0xff424242),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //DESCRIPTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                width: 350,
                child: Text(widget.event.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 14,
                    )),
              ),
            ),

            //DATE AND PLACE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/events.svg",
                    width: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.event.date,
                    style: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/map-pin.svg",
                    width: 28,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.event.adress,
                    style: TextStyle(
                      color: Color(0xff6A6A6A),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),
            
            //BUTTON 
            Center(
              child: MaterialButton(
                onPressed: () {
                  //FUNCTION TO TAKE EVENT
                },
                height: 45,
                minWidth: 260,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColors.primaryColor,
                child: Text("Принять участие", style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
