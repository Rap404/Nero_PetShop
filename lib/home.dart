import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<String> location = [
    "Olehsari, Glagah",
    'Giri, Banyuwangi',
    'Kalibaru, Banyuwangi',
    "Singotrunan, Banyuwangi",
    "Pengantigan, Banyuwangi",
  ];
  String selectLocation = '';

  List<String> items = [
    "Kucing",
    "Anjing",
    "Ikan",
    "Burung",
    "Reptil",
    "Lainya",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(240, 240, 240, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(19, 19, 19, 1),
                      Color.fromRGBO(49, 49, 49, 1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Poppins'),
                              ),
                              Row(
                                children: [
                                  DropdownButton<String>(
                                    dropdownColor:
                                        const Color.fromRGBO(94, 94, 94, 1),
                                    value: selectLocation.isEmpty
                                        ? null
                                        : selectLocation,
                                    hint: const Text(
                                      'choose your location',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    items: location.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            fontFamily: 'Sora',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      selectLocation = value!;
                                      setState(() {});
                                    },
                                    underline: Container(
                                      height: 0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(95, 30, 0, 0),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 350,
                        height: 52,
                        child: TextField(
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(49, 49, 49, 1),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                color: Color.fromRGBO(152, 152, 152, 1)),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            suffixIcon: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(198, 124, 78, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: const Icon(
                                Icons.tune,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -70),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/banner.png',
                      scale: 0.9,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                margin: const EdgeInsets.all(5),
                                width: 120,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? const Color.fromRGBO(198, 124, 78, 1)
                                      : Colors.white,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        color: current == index
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/tas.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.8',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 23.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Travel Pouch SUGAR GLIDER - tas sugar glider',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/p1.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 30.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Whiskas 450gr junior 2-12 bulan Makanan Kucing Whiskas',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/bando.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.0',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 15.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Aksesoris / Kalung Pita Lucu Untuk Kucing',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/tempat_eek.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 154.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Acis Cat Litter Box (Ls224) Tempat Pop Kucing',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/tas.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.8',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 23.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Travel Pouch SUGAR GLIDER - tas sugar glider',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/p1.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 30.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Whiskas 450gr junior 2-12 bulan Makanan Kucing Whiskas',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/bando.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.0',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 15.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Aksesoris / Kalung Pita Lucu Untuk Kucing',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 170,
                          height: 239,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/tempat_eek.png',
                                  ),
                                  Positioned(
                                    left: 5,
                                    child: Container(
                                      width: 50,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(50.0),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset(
                                            'assets/star.png',
                                            scale: 0.8,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          const Text(
                                            '4.3',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Rp. 154.000',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    width: 140,
                                    child: const Text(
                                      'Acis Cat Litter Box (Ls224) Tempat Eek Kucing',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 11,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
