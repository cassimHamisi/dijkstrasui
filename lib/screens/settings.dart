import 'package:dijkstrasui/components/settings/sort_algorithm.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // create an instance of tree bloc
  TreeBloc treeBloc = TreeBloc();
  @override
  void initState() {
    super.initState();
    treeBloc.binarySearch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: treeBloc.treeStream,
      builder: (context, snapshot) {
        // if (snapshot.hasData) {
        //   return Center(
        //     child: ElevatedButton(
        //       onPressed: () {},
        //       child: const Text("Start"),
        //     ),
        //   );
        // }
        return Center(
          child: Container(
            height: 1000,
            width: 1000,
            color: const Color.fromARGB(255, 118, 168, 254),
            child: CustomPaint(
              painter: TreePainter(
                offset: snapshot.requireData,
                treeMap: treeBloc.treeMap,
                valueMap: treeBloc.valueMap,
              ),
            ),
          ),
        );
      },
    );
  }
}

const radius = 20;

class TreePainter extends CustomPainter {
  TreePainter(
      {required this.offset, required this.treeMap, required this.valueMap});
  Offset offset;
  Map<Offset, Offset> treeMap;
  Map<Offset, int> valueMap;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(offset, radius / 1.5, Paint()..color = Colors.black);
    // map through the tree
    treeMap.forEach((key, value) {
      //draw a circle
      canvas.drawCircle(
        key,
        radius / 1.5,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke,
      );
      // draw a line
      canvas.drawLine(key, value, Paint()..color = Colors.white);
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: valueMap[key].toString(),
          style: const TextStyle(
              fontSize: radius / 2,
              fontWeight: FontWeight.bold,
              color: Colors.green),
        ),
      );
      textPainter.layout();
      final w = textPainter.size.width;
      final h = textPainter.size.height;
      textPainter.paint(canvas, Offset(key.dx - (w / 2), key.dy - (h / 20)));
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
