import 'package:flutter/material.dart';
import 'package:rich_text_field/rich_editable_text.dart';
import 'package:rich_text_field/rich_text_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RichRichTextEditingController2 _controller2 = RichRichTextEditingController2();

  var textStyle = TextStyle(color: Colors.black, fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          // RichTextField(
          //   style: TextStyle(textBaseline: TextBaseline.ideographic),
          //   controller: _controller2,
          //   maxLines: null,
          // ),
          RichText(text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: "456",
                style: TextStyle(inherit: false, backgroundColor: Colors.red)
              ),
              TextSpan(text: "789")
            ]
          )),
          Row(
            children: <Widget>[
              MaterialButton(
                child: Text("test"),
                onPressed: () {
                  _controller2.addWidgetSpan(WidgetSpan(child: Icon(Icons.ac_unit)));
                },
              )
            ],
          ),
        ],
      )
    );
  }
}

class RichRichTextEditingController2 extends RichTextEditingController {
  @override
  TextSpan buildTextSpan({TextStyle style, bool withComposing}) {
    return super.buildTextSpan(style: style, withComposing: withComposing);


//    print(text);
//
//    List<InlineSpan> inlineSpans = List();
//
//    int lastBaseOffset = 0;
//    widgetSpanLocationList.forEach((element) {
//      String substring = text.substring(lastBaseOffset, element.baseOffset);
//      inlineSpans.add(TextSpan(style: style, text: substring));
//      inlineSpans.add(element.widgetSpan);
//      lastBaseOffset = element.baseOffset;
//    });
//    inlineSpans.add(TextSpan(style: style, text: text.substring(lastBaseOffset)));
//    if (inlineSpans.isEmpty) {
//      return super.buildTextSpan(style: style, withComposing: withComposing);
//    }
//
//    return TextSpan(
//      style: style,
//      children: inlineSpans
//    );



//    final TextStyle composingStyle = style.merge(
//      const TextStyle(textBaseline: TextBaseline.ideographic),
//    );
//
//    if (!value.composing.isValid || !withComposing) {
//      if (text.length != 0) {
//        return TextSpan(
//          style: style,
//          children: <InlineSpan>[
//            TextSpan(text: text),
//            widgetSpan,
//            TextSpan(style: TextStyle(color: Colors.black), text: "66666666666666\n6666666666"),
//            WidgetSpan(
//                child: SizedBox(
//                  width: 120,
//                  height: 120,
//                  child: Icon(Icons.style),
//                )
//            )
//          ],
//        );
//      } else {
//        return TextSpan(
//            style: style, text: text
//        );
//      }
//    }
//
//    return TextSpan(
//      style: style,
//      children: <InlineSpan>[
//        TextSpan(text: text),
//        widgetSpan,
//        TextSpan(style: TextStyle(color: Colors.black), text: "66666666666666\n6666666666"),
//        WidgetSpan(
//            child: SizedBox(
//              width: 120,
//              height: 120,
//              child: Icon(Icons.style),
//            )
//        )
//      ],
//    );
  }
}
