import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'utils.dart';
import 'package:fle_project/french_quizz_app.dart';

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // onboardingHMe (5:79)
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 39 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // app1ETE (5:113)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 32 * fem),
              width: 381 * fem,
              height: 490 * fem,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100 * fem),
                  bottomLeft: Radius.circular(100 * fem),
                ),
                child: Image.asset(
                  'assets/app.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // contenttXn (5:87)
              margin: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 24 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group1000003277cig (5:89)
                    margin: EdgeInsets.fromLTRB(
                        15 * fem, 0 * fem, 14 * fem, 33 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          // apprenezdemanireludiqueX4x (5:90)
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 1 * fem, 9 * fem),
                            constraints: BoxConstraints(
                              maxWidth: 250 * fem,
                            ),
                            child: Text(
                              'Apprenez de manière ludique',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3333333333 * ffem / fem,
                                letterSpacing: 0.12 * fem,
                                color: Color(0xff111111),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          // disclaimeraucunpetitaminatviol (5:91)
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 298 * fem,
                            ),
                            child: Text(
                              'Disclaimer : Aucun petit-ami n’a été violenté pour les besoins de ce prototype',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Plus Jakarta Sans',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5714285714 * ffem / fem,
                                letterSpacing: 0.07 * fem,
                                color: Color(0xff78828a),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // actionKYY (5:92)
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // labelqWt (I5:94;23:223)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 19 * fem),
                          child: TextButton(
                            onPressed: () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FrenchQuizApp()),
                                );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 58 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff7c73c3),
                                borderRadius: BorderRadius.circular(24 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Commencez maintenant',
                                  style: SafeGoogleFont(
                                    'Plus Jakarta Sans',
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.4444444444 * ffem / fem,
                                    letterSpacing: 0.09 * fem,
                                    color: Color(0xfffefefe),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // autogroupqm9wGcC (LvP6UkCxFNdtk3yeRgqm9W)
                          margin: EdgeInsets.fromLTRB(
                              54.5 * fem, 0 * fem, 56 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                // pasdecompteymW (5:93)
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 1.5 * fem, 0 * fem),
                                  child: Text(
                                    'Pas de compte ? ',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      letterSpacing: 0.08 * fem,
                                      color: Color(0xff111111),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                // tantpisbgH1W (8:120)
                                child: TextButton(
                                  onPressed: () {
                                   Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => FrenchQuizApp()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    'Tant pis bg',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Plus Jakarta Sans',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      letterSpacing: 0.08 * fem,
                                      color: Color(0xff009b8d),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
