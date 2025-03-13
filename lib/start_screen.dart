import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.switchQz, {super.key});
  final void Function() switchQz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'asset/images/applo.png',
            width: 300,
            //color: const Color.fromARGB(135, 255, 255, 255),
          ),
          //Opacity(
          // opacity: 0.75,
          //  child:Image.asset(
          //   'asset/images/applo.png',
          //  width: 300,
          // ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Text('QUIZ ON THE TOPIC FLUTER',
              style: GoogleFonts.lato(color: Color.fromARGB(255,237, 223, 252),fontSize: 24,),),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            onPressed: switchQz,
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 31, 7, 166),),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('START THE QUIZ'),
          )
        ],
      ),
    );
  }
}
//Image.asset('asset/images/applo.png')