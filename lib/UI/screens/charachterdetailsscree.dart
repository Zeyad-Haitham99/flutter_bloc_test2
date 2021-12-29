import 'package:flutter/material.dart';
import 'package:flutter_bloc_test2/data/models/charachters.dart';

class CharachterDetailsScreen extends StatelessWidget {
  final Charachter charachter;
  const CharachterDetailsScreen({Key? key, required this.charachter})
      : super(key: key);

  Widget buildSilverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          "${charachter.nickname}",
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: charachter.charId!,
          child: Image.network(
            charachter.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget charachterInfo(String title, String value) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: Colors.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          buildSilverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
                margin: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    charachterInfo(
                        "Job : ", charachter.occupation!.join(' / ')),
                    buildDivider(315),
                    charachterInfo(
                        "Seasons : ", charachter.appearance!.join(' / ')),
                    buildDivider(250),
                    charachterInfo("Appered In : ", charachter.category!),
                    buildDivider(315),
                    charachterInfo("Statues : ", charachter.status!),
                    buildDivider(320),
                    // charachter.betterCallSaulAppearance!.isEmpty
                    //     ? Container()
                    //     : charachterInfo("Better call saul seasons : ",
                    //         charachter.betterCallSaulAppearance!.join(' / ')),
                    // buildDivider(315),
                    charachterInfo("Actor/Actress : ", charachter.portrayed!),
                    buildDivider(215),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              )
            ]),
          )
        ],
      ),
    );
  }
}
