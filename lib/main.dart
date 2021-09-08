import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      ProviderScope(child: MyApp())
  );
}

final selectedPageProvider = StateProvider<int>((_) {
  return 0;
});
final canContinueProvider = StateProvider<bool>((_) {
  return false;
});

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

class App extends ConsumerWidget {
  final List<Widget> pages = [
    Widget1(),
    Widget2(),
    Widget3(),
  ];
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pageNumber = watch(selectedPageProvider).state;
    final Widget spacer = SizedBox(height: 40.0,);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(pageNumber);
          if (pageNumber < 2) {
            context.read(selectedPageProvider).state++;
          }
        },
      ),
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(Icons.train_outlined, size: 140.0, color: Colors.blue,),
              IconButton(
                color: Colors.white,
                iconSize: 40.0,
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (pageNumber > 0) {
                    context.read(selectedPageProvider).state--;
                  }
                },
              ),
              pages[pageNumber],
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
              spacer,
              Text('This is page filler', style: TextStyle(fontSize: 40.0, color: Colors.green.shade900),),
            ],
          ),
        ),
      ),
    );
  }
}

// Widgets.......

class Widget1 extends StatelessWidget {
  const Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Widget 1...', style: TextStyle(fontSize: 50.0, color: Colors.blue.shade900),),
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Widget 2...', style: TextStyle(fontSize: 50.0, color: Colors.blue.shade900),),
    );
  }
}

class Widget3 extends StatelessWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Widget 3...', style: TextStyle(fontSize: 50.0, color: Colors.blue.shade900),),
    );
  }
}


