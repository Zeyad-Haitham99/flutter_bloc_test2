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
  late List<Charachter> searchedCharachter;
  bool _issearching = false;
  final _SearchTextController = TextEditingController();

  Widget buildSearchField() {
    return TextField(
      controller: _SearchTextController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'Find  a Charachter',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style: TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (searchedcharachter) {
        addSearchedForItemsToList(searchedcharachter);
      },
    );
  }

  void addSearchedForItemsToList(searchedcharachter) {
    searchedCharachter = allCharachters
        .where((charachter) =>
            charachter.name!.toLowerCase().startsWith(searchedcharachter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (_issearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _issearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _issearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _SearchTextController.clear();
    });
  }
  // init state for getting all charachters and store them in the list

  @override
  void initState() {
    super.initState();

    BlocProvider.of<BreakingbadCubit>(context).getallCharachters();
  }

//Using Bloc to manage the state in the uI
  Widget builBlocWidget() {
    // Define the bloc using BlocBuilder...
    return BlocBuilder<BreakingbadCubit, BreakingbadState>(
      builder: (context, state) {
        if (state is CharachterLoaded) {
          allCharachters = (state).loadedCharachter;
          return buildLodedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
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

  Widget buildAppBar() {
    return Text(
      'Charachters',
      style: TextStyle(color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: _issearching ? buildSearchField() : buildAppBar(),
        leading: _issearching
            ? BackButton(
                color: Colors.grey,
              )
            : Container(),
        actions: _buildAppBarAction(),
      ),
      body: builBlocWidget(),
    );
  }

  Widget buildCharachterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _SearchTextController.text.isEmpty
          ? allCharachters.length
          : searchedCharachter.length,
      itemBuilder: (ctx, index) {
        return CharachterItem(
          charachter: _SearchTextController.text.isEmpty
              ? allCharachters[index]
              : searchedCharachter[index],
        );
      },
    );
  }
}
