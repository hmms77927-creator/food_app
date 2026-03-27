import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class Imge extends StatefulWidget {
  const Imge({super.key});

  @override
  State<Imge> createState() => _ImgeState();
}

class _ImgeState extends State<Imge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload',
          style: TextStyle(
            color: Color(0xFF181C2E),
            fontSize: 20,
            fontWeight: .w400,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 258,
              width: 342,
              decoration: DottedDecoration(shape: Shape.box),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 58,
                      height: 46,
                      child: Image.asset(
                        'assats/image/Upload icon (1).png',
                        fit: BoxFit.cover,
                      ),
                      // child: Icon(
                      //   Icons.cloud_download_outlined,
                      //   color: Color(0xFFEB4646),
                      // ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          child: Text(
                            'Drag & drop files or ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .w700,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          child: Text(
                            'Drag & drop files or ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFEB4646),
                              fontSize: 16,
                              fontWeight: .w700,
                              color: Color(0xFFEB4646),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      child: Text(
                        'Supported formates: JPEG, PNG, GIF, ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: .w400,
                          color: Color(0xFF676767),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'MP4, PDF, PSD, AI, Word, PPT ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w400,
                        color: Color(0xFF676767),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Opacity(
              opacity: 0.5,
              child: SizedBox(
                height: 45,
                width: 240,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFEB4646),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      side: BorderSide(color: Color(0xFFEB4646)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Upload Files',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
