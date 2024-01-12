import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_pet/model/user.dart';
import 'package:testing_pet/provider/auth_provider.dart';
import 'package:testing_pet/screens/home_screen.dart';
import 'package:testing_pet/screens/pet_add/pet_info_screen.dart';

class TabLogin extends StatefulWidget {
  const TabLogin({super.key});

  @override
  State<TabLogin> createState() => _TabLoginState();
}

class _TabLoginState extends State<TabLogin> {
  late AuthProvider authProvider;
  late KakaoAppUser kakaoAppUser;


  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
   // double percent = MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      body:OrientationBuilder(
          builder: ( context , orientation) {
            return orientation == Orientation.portrait
                ? _buildPort()  //세로 화면
                : _buildLand();  //가로화면
          },
      ),


    );
  }

  Widget _buildPort(){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage(
                    'assets/images/login_images/safe_area.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 240 ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFDE30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  authProvider.setLoading(true);

                  try {
                    await authProvider.kakaologin(context);

                    bool isLoggedIn =
                    await authProvider.checkKakaoLoginStatus();

                    if (isLoggedIn) {
                      bool isFirstTimeUser =
                      await authProvider.checkIfFirstTimeUser();

                      if (isFirstTimeUser) {
                        bool hasPetData =
                        await authProvider.checkIfUserHasPetDataInDatabase(
                            authProvider.appUser);

                        if (!hasPetData) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(appUser: authProvider.appUser!),
                            ),
                          );
                        }

                        if (hasPetData) {
                          // _WelcomeDialog(context);
                        } else if (authProvider.appUser != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetInfoScreen(
                                appUser: authProvider.appUser!,
                              ),
                            ),
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(appUser: authProvider.appUser!),
                          ),
                        );
                      }
                    } else if (authProvider.appUser != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetInfoScreen(
                            appUser: authProvider.appUser!,
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    print('로그인 실패: $e');
                  } finally {
                    authProvider.setLoading(false);
                  }
                },

                child: Container(
                  width: 323,
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/login_images/kakao_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '카카오아이디로 시작하기',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF725353),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 314,
            left: 115 ,
            child: Text(
              '동물과의 커뮤니케이션이 즐겁다!',
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildLand(){
      return Scaffold(
       body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:AssetImage(
                  'assets/images/login_images/safe_area.png'),
                fit: BoxFit.fill,
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 122 ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFFDE30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                onPressed: () async {
                  authProvider.setLoading(true);

                  try {
                    await authProvider.kakaologin(context);

                    bool isLoggedIn =
                    await authProvider.checkKakaoLoginStatus();

                    if (isLoggedIn) {
                      bool isFirstTimeUser =
                      await authProvider.checkIfFirstTimeUser();

                      if (isFirstTimeUser) {
                        bool hasPetData =
                        await authProvider.checkIfUserHasPetDataInDatabase(
                            authProvider.appUser);

                        if (!hasPetData) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(appUser: authProvider.appUser!),
                            ),
                          );
                        }

                        if (hasPetData) {
                         // _WelcomeDialog(context);
                        } else if (authProvider.appUser != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetInfoScreen(
                                appUser: authProvider.appUser!,
                              ),
                            ),
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(appUser: authProvider.appUser!),
                          ),
                        );
                      }
                    } else if (authProvider.appUser != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetInfoScreen(
                            appUser: authProvider.appUser!,
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    print('로그인 실패: $e');
                  } finally {
                    authProvider.setLoading(false);
                  }
                },

                child: Container(
                  width: 323 ,
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/login_images/kakao_logo.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '카카오아이디로 시작하기',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF725353),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 197,
            left: 325 ,
            child: Text(
              '동물과의 커뮤니케이션이 즐겁다!',
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
     );
    }
}
