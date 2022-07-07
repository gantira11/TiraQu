import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiraqu/components/custom_button.dart';
import 'package:tiraqu/components/on_boarding_content.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int currentPage = 0;
  final PageController _controller =
      PageController(initialPage: 0, keepPage: false);

  List<Map<String, String>> onBoardingData = [
    {
      "image": "assets/images/intro1.jpg",
      "title": "Bayar dan Berlangganan Air",
      "desc":
          "Dengan Login dan Berlangganan Anda akan diberikan kemudahan untuk mengecek tagihan dan membaya Air.",
    },
    {
      "image": "assets/images/intro2_3.png",
      "title": "Informasi seputar PDAM",
      "desc":
          "Dengan memakai aplikasi TiraQu Anda bisa melihat informasi dan berita seputar PDAM Tirta Raharja"
    },
    {
      "image": "assets/images/intro3.jpg",
      "title": "Pengajuan Pengaduan",
      "desc":
          "Dengan Login Anda akan diberikan kemudahan dalam mengajukan pengaduan untuk masalah air",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: size.height * 0.05,
        leading: Visibility(
          visible: currentPage == 0 ? false : true,
          child: IconButton(
            onPressed: () {
              setState(() {
                _controller.animateToPage(
                  currentPage - 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              });
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
            color: Colors.black,
            iconSize: 18,
            splashRadius: 20,
          ),
        ),
        title: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () async {
              Navigator.pushNamed(context, '/leanding');
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              _prefs.setString('opened', 'open');
            },
            child: const Text(
              "Lewati",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height:
                    currentPage == 2 ? size.height * 0.83 : size.height * 0.89,
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) => {
                    setState(() {
                      currentPage = value;
                    })
                  },
                  itemCount: onBoardingData.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                    image: onBoardingData[index]["image"].toString(),
                    title: onBoardingData[index]["title"].toString(),
                    desc: onBoardingData[index]["desc"].toString(),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: currentPage == 2 ? 0 : 1,
                duration: currentPage == 2
                    ? const Duration(milliseconds: 700)
                    : const Duration(milliseconds: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 6),
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color:
                            currentPage == index ? Colors.blue : Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                opacity: currentPage == 2 ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                child: Visibility(
                  visible: currentPage == 2 ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubmitButton(
                      textButton: 'Halaman Utama',
                      onPressed: () async {
                        Navigator.pushNamed(context, '/leanding');
                        SharedPreferences _prefs =
                            await SharedPreferences.getInstance();
                        _prefs.setString('opened', 'open');
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
