import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test2/UI/widgets/charachter_item.dart';
import 'package:flutter_bloc_test2/bussiness_layer/cubit/breakingbad_cubit.dart';
import 'package:flutter_bloc_test2/data/models/charachters.dart';

class CharachtersScreen extends StatefulWidget {
  const CharachtersScreen({Key? key}) : super(key: key);

  @override
  State<CharachtersScreen> createState() => _CharachtersScreenState();
}

class _CharachtersScreenState extends State<CharachtersScreen> {
  late List<Charachter> allCharachters;
  @override
  void initState() {
    super.initState();
    allCharachters =
        BlocProvider.of<BreakingbadCubit>(context).getallCharachters();
  }

  Widget builBlocWidget() {
    return BlocBuilder<BreakingbadCubit, BreakingbadState>(
      builder: (context, state) {
        if (state is CharachterLoaded) {
          allCharachters = (state).loadedCharachter;
          return buildLodedListWidgets();
          print('Heloo');
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }

  Widget buildLodedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            buildCharachterList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          'Charachters',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: builBlocWidget(),
    );
  }

  Widget buildCharachterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1/2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharachters.length,
      itemBuilder: (ctx, index) {
        return CharachterItem(charachter: allCharachters[index],);
      },
    );
  }
}
