import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:media_booster_stagerred_view/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  home_provider? ht, hf;

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<home_provider>(context, listen: true);
    hf = Provider.of<home_provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade400,
        appBar: AppBar(
          title: Text("Staggered RecyclerView"),
        ),
        body: GridView.custom(gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: 1,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: hf!.images.length,
                (context, index) => theme(index: index),
          ),        ),
      ),
    );
  }

  Widget theme({required int index}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
          child: Image.asset("${hf!.images[index]}",fit: BoxFit.fill)),
    );
  }
}
