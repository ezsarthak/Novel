import 'package:flutter/material.dart';
import '../components/about_tile.dart';
import '../components/novel_text.dart';
import '../setup/app_details.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).backgroundColor,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 44, left: 44, top: 28, bottom: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      textName: 'About',
                      fontSize: 32,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      textName: "Know More",
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      textColor: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                const AboutTile(
                  title: creditName,
                  subTitle: creditDescription,
                  handle: creditHandle,
                  profile: creditUrl,
                  handleUrl: creditHandleUrl,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).indicatorColor.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomText(
                  textName: "Dashboard",
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 3,
                  textColor: Theme.of(context).textTheme.labelLarge!.color,
                ),
                const SizedBox(
                  height: 12,
                ),
                const AboutTile(
                    title: "Sarthak Patil",
                    subTitle: "App Dev And Designer",
                    handle: "Telegram",
                    handleUrl: "https://t.me/im_dope",
                    profile: "https://i.imgur.com/oHQRX2B.jpg"),
                const AboutTile(
                    title: "Piyush KPV",
                    subTitle: "Senior Designer",
                    handle: "Instagram",
                    handleUrl: "https://www.instagram.com/kpv.piyush",
                    profile: "https://i.imgur.com/qacy6VQ.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


      //  ListView(
      //             physics: const BouncingScrollPhysics(),
      //             scrollDirection: Axis.vertical,
      //             shrinkWrap: true,
      //             clipBehavior: Clip.none,
      //             padding: const EdgeInsets.only(left: 18, right: 18),
      //             children: [
      //               Entry.all(
      //                 delay: const Duration(milliseconds: 20),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                   children: [
      //                     CircleAvatar(
      //                       backgroundColor: Colors.transparent,
      //                       backgroundImage: CachedNetworkImageProvider(url),
      //                       radius: MediaQuery.of(context).size.width * 0.2,
      //                     ),
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         CustomText(
      //                           textName: "Sarthak Designs",
      //                           fontSize: 18,
      //                           textColor: Theme.of(context)
      //                               .textTheme
      //                               .labelLarge!
      //                               .color,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                         const SizedBox(
      //                           height: 8,
      //                         ),
      //                         CustomText(
      //                           textName: "Wallpapers Designer",
      //                           fontSize: 15,
      //                           textColor: Theme.of(context)
      //                               .textTheme
      //                               .labelMedium!
      //                               .color,
      //                           fontWeight: FontWeight.w700,
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(
      //                 height: 8,
      //               ),
      //               SettingsPanel(panelName: "Social Accounts", items: [
      //                 CustomSettingsTile(
      //                     title: "Twitter",
      //                     trailing: CustomButton(
      //                       backgroundColor: Colors.transparent,
      //                       // padding: const EdgeInsets.all(10),
      //                       buttonContent: Icon(
      //                         Iconsax.send_2,
      //                         size: 32,
      //                         color: Theme.of(context)
      //                             .primaryColor
      //                             .withOpacity(0.7),
      //                       ),
      //                     ),
      //                     onTap: () async {
      //                       const url = "https://twitter.com/SarthakDesigns";
      //                       if (await canLaunch(url)) {
      //                         await launch(url);
      //                       }
      //                     }),
      //                 const SizedBox(
      //                   height: 12,
      //                 ),
      //                 CustomSettingsTile(
      //                   title: "Telegram",
      //                   trailing: CustomButton(
      //                     backgroundColor: Colors.transparent,
      //                     // padding: const EdgeInsets.all(10),
      //                     buttonContent: Icon(
      //                       Iconsax.send_2,
      //                       size: 32,s
      //                       color:
      //                           Theme.of(context).primaryColor.withOpacity(0.7),
      //                     ),
      //                   ),
      //                   onTap: () async {
      //                     const url = "https://t.me/Wallery_Walls";
      //                     if (await canLaunch(url)) {
      //                       await launch(url);
      //                     }
      //                   },
      //                 ),
      //                 const SizedBox(
      //                   height: 12,
      //                 ),
      //                 CustomSettingsTile(
      //                     title: "Instagram",
      //                     trailing: CustomButton(
      //                       backgroundColor: Colors.transparent,
      //                       // padding: const EdgeInsets.all(10),
      //                       buttonContent: Icon(
      //                         Iconsax.send_2,
      //                         size: 32,
      //                         color: Theme.of(context)
      //                             .primaryColor
      //                             .withOpacity(0.7),
      //                       ),
      //                     ),
      //                     onTap: () async {
      //                       const url =
      //                           "https://www.instagram.com/sarthak_designs";
      //                       if (await canLaunch(url)) {
      //                         await launch(url);
      //                       }
      //                     }),
      //               ])
      //             ],
      //           ),