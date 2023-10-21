import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network("https://4rw2djeofma22jhkhr2a3ibdt27yvqa2tuem7i5lvyji4bcm42hq.arweave.net/5G2hpI4rAa0k6jx0DaAjnr-KwBqdCM-jq64SjgRM5o8", color: Colors.blue,),
            const Padding(padding: EdgeInsets.only(top:10)),
            const Text("SalonDev 2023",
              style: TextStyle(
                  fontSize: 42,
                  fontFamily: "Poppins"
              ),
            ),
            const Padding(padding: EdgeInsets.only(top:10)),
            const Text("Salon virtuel du développement de Kevin Mbitkebeyo",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),

          ],
        )
    );
  }
}

