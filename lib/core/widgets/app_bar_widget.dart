import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.imageUrl,
      this.planText,
      this.bottom,
      this.showBasicButton = false,
      this.showLeadingButton = false,
      this.onBasicTap,
      this.onLeadingTap,
      this.showBackButton = true,
      this.subscriptionPlan})
      : super(key: key);
  final String? planText;
  final String? imageUrl;
  final showBackButton;
  final PreferredSizeWidget? bottom;
  final String? subscriptionPlan;
  final bool showBasicButton;
  final Function? onBasicTap;
  final Function? onLeadingTap;
  final bool showLeadingButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: showBackButton,
      // leadingWidth: showLeadingButton ? 70 : 60,
      // leading: showLeadingButton
      //     ? IconButton(
      //         padding: EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 16),
      //         icon: Container(
      //           width: 30,
      //           child: Stack(
      //             // alignment: Alignment.topRight,
      //             children: [
      //               Icon(Icons.menu),
      //               Positioned(
      //                 right: 0,
      //                 top: 0,
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(18.0),
      //                   child: Container(
      //                       padding: EdgeInsets.only(left: 15),
      //                       color: AppTheme.primaryGreen,
      //                       height: 8,
      //                       width: 8,
      //                       child: SizedBox()),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         onPressed: onLeadingTap,
      //       )
      //     : null,
      elevation: 12,
      centerTitle: true,
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topRight,
      //           end: Alignment.bottomLeft,
      //           colors: <Color>[
      //         AppTheme.maroonRedColor,
      //         AppTheme.primaryColor
      //       ])),
      // ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      title: Text(
        "Medicos",
        style: Theme.of(context).textTheme.headline6,
      ),
      // actions: <Widget>[
      //   showBasicButton
      //       ? GestureDetector(
      //           onTap: onBasicTap,
      //           child: Container(
      //             // height: 10,
      //             // width: 60.0,
      //             decoration: BoxDecoration(
      //               color: Colors.black,
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(8.0),
      //               ),
      //             ),
      //             margin: EdgeInsets.all(15.0),
      //             padding: EdgeInsets.symmetric(horizontal: 12.0),
      //             child: Center(
      //               child: Text(
      //                 subscriptionPlan.toUpperCase(),
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 11.0,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         )
      //       : SizedBox(),
      //   imageUrl == null
      //       ? SizedBox()
      //       : Padding(
      //           padding: const EdgeInsets.only(right: 8.0),
      //           child: Container(
      //             width: 70.0,
      //             child: IconButton(
      //               icon: ClipOval(
      //                 child: Align(
      //                   heightFactor: 1,
      //                   widthFactor: 1,
      //                   child: Image.network(imageUrl),
      //                 ),
      //               ),
      //               onPressed: () {
      //                 // Get.to(ProfilePage());
      //               },
      //             ),
      //           ),
      //         ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
