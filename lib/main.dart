import 'package:bloctutorial/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
   home: BlocProvider(create: (context)=> CounterBloc(),
   child:CounterScreen())));
}

class CounterScreen extends StatefulWidget {
  CounterScreenState createState()=> CounterScreenState();

}
class CounterScreenState extends State<CounterScreen>{

  CounterBloc ?_counterBlocSink;

  @override
  void dispose(){
    super.dispose();
    _counterBlocSink?.close();

  }

  @override
  Widget build(BuildContext context) {
    _counterBlocSink= BlocProvider.of<CounterBloc>(context);
    return    Scaffold(
      appBar: AppBar(
        title: Text("CounterApp"),
      ),
      body: Container(
        child: BlocBuilder<CounterBloc,CounterState>(
            builder: (context,state){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You have clicked ${(state as LatestCounterState).newCounterValue} Times"),
                  FlatButton(onPressed: (){
                    _counterBlocSink!.add(IncreaseCounterEvent());

                  }, child: Text("Increase Counter"),
                    color: Colors.lightGreenAccent,
                  ),

                  FlatButton(onPressed: (){
                    _counterBlocSink!.add(DecreaseCounterEvent());

                  }, child: Text("Decrease Counter"),
                    color: Colors.red,
                  )
                ],
              );
            }),
      ),

    );
  }
}
