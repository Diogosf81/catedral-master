import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MinisteriosScreen extends StatefulWidget {
  const MinisteriosScreen({Key? key}) : super(key: key);

  @override
  State<MinisteriosScreen> createState() => _MinisteriosScreenState();
}

class _MinisteriosScreenState extends State<MinisteriosScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          //foregroundColor: Color.fromARGB(255, 22, 125, 127),
          title: Text(
            'Ministérios',
            style: TextStyle(),
          ),
          backgroundColor: Color.fromARGB(255, 22, 125, 127),
          //elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            //labelPadding: EdgeInsets.symmetric(horizontal: 30),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.white, width: 2),
                insets: EdgeInsets.symmetric(horizontal: 28)),
            //indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Catedral Kids'),
              Tab(text: 'Catedral Juniores'),
              Tab(text: 'Catedral Jovem'),
              Tab(text: 'Jovens Casais'),
              Tab(text: 'Recomeçar'),
              Tab(text: 'Manancial Feminino'),
              Tab(text: 'Grupo Familiar'),
              Tab(text: 'Shama'),
              Tab(text: 'Catedral Business'),
              Tab(text: 'Escola da Família'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ///CATEDRAL KIDS
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/1-1.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Catedral Kids:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério Infantil - Para crianças de 0 a 8 anos, seus filhos aprenderão melhor sobre a palavra de Deus, '
                            'com crianças da mesma faixa etária, brincando, louvando e se divertindo da melhor forma. Nossos dias de cultos são: Quarta-feira às 20h | '
                            'Domingo às 09h Café da manhã | Domingo às 09h30 EBD | Domingo às 11h Cultão Kids | Domingo às 18h30 Cultão Kids',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @catedral.kids')
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Youtube '),
                            SvgPicture.asset(
                              'assets/svg/youtube.svg',
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - Catedral Kids Oficial')
                          ],
                        ),
                        SizedBox(height: 5),
                        Text('Líderes: Jordana Vilela, Tio Léo, Tia Paula',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///CATEDRAL JUNIORES
            Center(
                child: Column(
              children: [
                Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: FadeInImage(
                      image: NetworkImage(
                          'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/2.png'),
                      placeholder: AssetImage("assets/aguarde.png"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_off,
                              color: Colors.grey,
                              size: 40,
                            ),
                            Text(
                              'Ocorreu um erro ao carregar. Verifique sua conexão!',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        );
                      },
                      fit: BoxFit.contain,
                    )),
                Text('Catedral Juniores:',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Ministério de Pré-adolescentes – Para idade de 09 a 12 anos. '
                          'Nossos encontros são:  Toda quarta-feira às 20h | Domingo às 09h Café da manhã | '
                          'Domingo às 09h30 EBD | Domingo às 18h Culto de Celebração. ',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                      // Text(
                      //   'Siga as nossas redes sociais:',
                      //   style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(height: 5),
                      // Row(
                      //   children: [
                      //     Text('Instagram '),
                      //     SvgPicture.asset(
                      //       'assets/svg/instagram.svg',
                      //       height: 20,
                      //       width: 20,
                      //       color: Color.fromARGB(255, 22, 125, 127),
                      //     ),
                      //     Text(' - @catedral.kids')
                      //   ],
                      // ),
                      // SizedBox(height: 5),
                      // Row(
                      //   children: [
                      //     Text('Youtube '),
                      //     SvgPicture.asset(
                      //       'assets/svg/youtube.svg',
                      //       height: 20,
                      //       width: 20,
                      //       fit: BoxFit.cover,
                      //       color: Color.fromARGB(255, 22, 125, 127),
                      //     ),
                      //     Text(' - Catedral Kids Oficial')
                      //   ],
                      // ),
                      // SizedBox(height: 5),
                      // Text('Líderes: Jordana Vilela, Tio Léo, Tia Paula',
                      //     style:
                      //         GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            )),

            ///CATEDRAL JOVEM
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/4.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Catedral Jovem:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério de Jovens – Salvação,  Entrega e Santidade é o nosso lema. Nossa meta é alcançar uma geração para Jesus, deixaremos o seu legado marcado aqui na terra.'
                            '\nNossos encontros: \nSábado às 20h | Domingo às 09h Café da manhã | Domingo às 09h30 EBD | Domingo às 18h Culto de Celebração.',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @catedraljovemsede')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líderes: Henrique Oliveira, Samuel  e Ana Clara ',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///JOVENS CASAIS
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.com.br/wp-content/uploads/2018/04/LOGO-CATEDRAL-JOVENS-CASAIS-300x178.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Jovens Casais:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério para noivo e casados. Encontro com palavra, louvor, comunhão e muito ensinamento. Venha fortalecer o seu casamento.'
                            'Toda quinta-feira às 20h!',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @jovenscasaiscf')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líderes: Amanda Vilela e Luiz Felipe',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///RECOMEÇAR
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.com.br/wp-content/uploads/2021/06/RECOME%C3%87AR-SITE-DA-IGREJA-300x169.jpg'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Recomeçar:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério para solteiros adultos, divorciados, viúvos, para todos os que desejam se reencontrar, buscar à Deus e cuidar da sua vida espiritual e amorosa.'
                            ' 2ª e 4ª sexta-feira do mês, às 20h.',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @catedralrecomecar')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líder: Pr. Diogo de Sousa',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///MANANCIAL FEMININO
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/7.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Manancial Feminino:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério de Mulheres, nossas reuniões são voltadas para todas as mulheres que desejam mais de Deus,'
                            ' mais conhecimento, mais aprendizado, buscam a cura da alma, do espiritual e para seus relacionamentos. Toda segunda-feira às 14hs. ',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @manancialfeminino')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líder: Pra. Cássia Vilela',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///GRUPO FAMILIAR
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/8.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Grupo Familiar:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'São pequenos grupos divididos em residências, para comunhão e edificação da palavra. '
                            'Encontre um grupo próximo perto de você, aqui no app existe um espaço com todos os endereços e contato dos líderes. ',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @grupos.familiares.catedral')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text(
                            'Líderes: Pr. Roberto e Pra. Tereza, \nPrs. João Lourenço e Maria José, \nPrs. Alexandre e Lara, \nPrs. Diogo e Edilene, \nPrs. Walber e Suzete',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///SHAMA
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/9.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Shama:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Shama Companhia de Dança – Ministério de Dança e Adoração.'
                            'Você que tem o dom, desejo e ama servir ao Senhor com sua dança, faça parte do nosso grupo!',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        // Text(
                        //   'Siga as nossas redes sociais:',
                        //   style:
                        //   GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Instagram '),
                        //     SvgPicture.asset(
                        //       'assets/svg/instagram.svg',
                        //       height: 20,
                        //       width: 20,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - @catedral.kids')
                        //   ],
                        // ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líder: Amanda Vilela',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///CATEDRAL BUSINESS
            Center(
              child: Column(
                children: [
                  Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: FadeInImage(
                        image: NetworkImage(
                            'http://catedraldafamilia.siteoficial.ws/wp-content/uploads/2018/04/1-1.png'),
                        placeholder: AssetImage("assets/aguarde.png"),
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_off,
                                color: Colors.grey,
                                size: 40,
                              ),
                              Text(
                                'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      )),
                  Text('Catedral Business:',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ministério de empreendedorismo, acontecem reuniões e eventos para ensinamentos e networking. Você que é empresário não pode ficar de fora! ',
                            textAlign: TextAlign.justify),
                        Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                        Text(
                          'Siga as nossas redes sociais:',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Instagram '),
                            SvgPicture.asset(
                              'assets/svg/instagram.svg',
                              height: 20,
                              width: 20,
                              color: Color.fromARGB(255, 22, 125, 127),
                            ),
                            Text(' - @catedralbusinessoficial')
                          ],
                        ),
                        // SizedBox(height: 5),
                        // Row(
                        //   children: [
                        //     Text('Youtube '),
                        //     SvgPicture.asset(
                        //       'assets/svg/youtube.svg',
                        //       height: 20,
                        //       width: 20,
                        //       fit: BoxFit.cover,
                        //       color: Color.fromARGB(255, 22, 125, 127),
                        //     ),
                        //     Text(' - Catedral Kids Oficial')
                        //   ],
                        // ),
                        SizedBox(height: 5),
                        Text('Líder: Pr. Flávio Varela Torres',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///ESCOLA DA FAMÍLIA
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text('Líderes: Pr. Adriano Lima e Mônica Lima ',
                          textAlign: TextAlign.left,
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),

                      ///PCE
                      Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://catedraldafamilia.com.br/wp-content/uploads/2017/01/1-300x211.png'),
                            placeholder: AssetImage("assets/aguarde.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Text(
                                    'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              );
                            },
                            fit: BoxFit.contain,
                          )),
                      Text(
                        'PCE - Pilares para um Casamento Estável',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'Tem por objetivo transmitir princípios básicos extraídos da Bíblia Sagrada, para um melhor relacionamento entre os casais.',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 15,
                        color: Colors.grey,
                      ),

                      ///Educar
                      Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://catedraldafamilia.com.br/wp-content/uploads/2017/01/2-300x211.png'),
                            placeholder: AssetImage("assets/aguarde.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Text(
                                    'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              );
                            },
                            fit: BoxFit.contain,
                          )),
                      Text('Educar - Educando Filhos à Maneira de Deus',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      Text(
                          'Através do ensino de princípios bíblicos, os pais são levados a uma fascinante jornada que os ajudará a educar os seus filhos, através de um relacionamento de amor e confiança.',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 15,
                        color: Colors.grey,
                      ),

                      ///ONE
                      Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://catedraldafamilia.com.br/wp-content/uploads/2017/01/3-300x211.png'),
                            placeholder: AssetImage("assets/aguarde.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Text(
                                    'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              );
                            },
                            fit: BoxFit.contain,
                          )),
                      Text('ONE - Curso Para Noivos',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      Text(
                          'Delineado para aqueles que vão se casar pela primeira vez. Neste curso você aprenderá princípios bíblicos que, quando aplicados, garantirá um relacionamento conjugal saudável e duradouro.',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 15,
                        color: Colors.grey,
                      ),

                      ///PSF
                      Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://catedraldafamilia.com.br/wp-content/uploads/2017/01/4-300x211.png'),
                            placeholder: AssetImage("assets/aguarde.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Text(
                                    'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              );
                            },
                            fit: BoxFit.contain,
                          )),
                      Text('PSF - Princípios Para o Sucesso Financeiro',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      Text(
                          'Visa ensinar às pessoas os princípios de Deus na área financeira, para que conheçam a Cristo mais intimamente e sejam livres para servi-Lo como Senhor das suas vidas.',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 15,
                        color: Colors.grey,
                      ),

                      ///Restauração da Alma
                      Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FadeInImage(
                            image: NetworkImage(
                                'http://catedraldafamilia.com.br/wp-content/uploads/2017/01/5-300x211.png'),
                            placeholder: AssetImage("assets/aguarde.png"),
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cloud_off,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Text(
                                    'Ocorreu um erro ao carregar. Verifique sua conexão!',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              );
                            },
                            fit: BoxFit.contain,
                          )),
                      Text('Restauração da Alma',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      Text(
                          'Neste curso a pessoa tem a oportunidade de experimentar uma transformação profunda em sua vida emocional, relacional e familiar.',
                          textAlign: TextAlign.justify),
                      Divider(
                        height: 15,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
