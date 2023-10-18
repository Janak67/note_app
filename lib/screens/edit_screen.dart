import 'package:flutter/material.dart';
import 'package:note_app/utils/app_colors.dart';
import 'package:note_app/utils/global.dart';
import '../utils/font_list.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtContent = TextEditingController();
  int fontcolor = 0;
  int fontStyle = 0;
  bool italic = false;
  bool bold = false;
  double _value = 15;
  TextAlign txtAlign = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    TextField(
                      textAlign: txtAlign,
                      controller: txtTitle,
                      style: TextStyle(
                          color: backgroundColors[fontcolor],
                          fontSize: _value,
                          fontStyle:
                              italic ? FontStyle.italic : FontStyle.normal,
                          fontWeight:
                              bold ? FontWeight.bold : FontWeight.normal,
                          fontFamily: fontList[fontStyle]),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    TextField(
                      controller: txtContent,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight:
                              bold ? FontWeight.normal : FontWeight.bold),
                      maxLines: null,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Something here',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Slider(
                      value: _value,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      divisions: 10,
                      max: 60,
                      min: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (fontcolor < backgroundColors.length - 1) {
                                    fontcolor++;
                                  } else {
                                    fontcolor = 0;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.format_color_text,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  bold = !bold;
                                });
                              },
                              icon: const Icon(
                                Icons.format_bold_sharp,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  italic = !italic;
                                });
                              },
                              icon: const Icon(
                                Icons.format_italic_sharp,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = TextAlign.left;
                                });
                              },
                              icon: const Icon(
                                Icons.format_align_left,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = TextAlign.center;
                                });
                              },
                              icon: const Icon(
                                Icons.format_align_center,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  txtAlign = TextAlign.right;
                                });
                              },
                              icon: const Icon(
                                Icons.format_align_right,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {},
                              // onPressed: () async {
                              //   File file = await saveImage();
                              //   await Share.shareXFiles([XFile(file.path)]);
                              // },
                              icon: const Icon(
                                Icons.share,
                                color: Colors.black,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  fontcolor = 2;
                                  fontStyle = 0;
                                  italic = false;
                                  bold = false;
                                  _value = 15;
                                  txtAlign = TextAlign.left;
                                });
                              },
                              icon: const Icon(
                                Icons.lock_reset,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: fontList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                fontStyle = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Hello  ",
                                style: TextStyle(
                                    fontFamily: fontList[index],
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Map m1 = {"Title": txtTitle.text, "details": txtContent.text};
            Global.g1.notelist.add(m1);
            Navigator.pop(context, [txtTitle.text, txtContent.text]);
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}
