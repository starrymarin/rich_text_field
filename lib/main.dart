import 'package:flutter/material.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RichTextField richTextField = RichTextField(
    controller: RichTextEditingController(),
    maxLines: null,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: richTextField,
      )
    );
  }
}

class RichTextEditingController extends TextEditingController {
  WidgetSpan widgetSpan = WidgetSpan(child: Icon(Icons.access_alarm));
  @override
  TextSpan buildTextSpan({TextStyle style, bool withComposing}) {
    TextSpan textSpan = TextSpan(
      style: style,
      children: <InlineSpan>[
        TextSpan(text: text),
        widgetSpan,
        TextSpan(style: TextStyle(color: Colors.black), text: "66666666666666\n6666666666"),
        WidgetSpan(
            child: SizedBox(
              width: 120,
              height: 120,
              child: Icon(Icons.style),
            )
        )
      ],
    );

    if (!value.composing.isValid || !withComposing) {
      if (text.length != 0) {
        return textSpan;
      } else {
        return TextSpan(
            style: style, text: text
        );
      }
    }

    return textSpan;
  }
}
