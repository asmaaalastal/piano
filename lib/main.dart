import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:piano/piano.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Piano Demo',
        home: Center(
          child: InteractivePiano(
            highlightedNotes: [
              NotePosition(note: Note.C, octave: 3)
            ],
            naturalColor: Colors.white,
            accidentalColor: Colors.black,
            keyWidth: 60,
            noteRange: NoteRange.forClefs([
              Clef.Treble,
            ]),
            onNotePositionTapped: (position) {
              // Use an audio library like flutter_midi to play the sound
            },
          ),
        ));
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlutterMidi fm = new FlutterMidi();
  void load(String asset) async {
    fm.unmute(); // Optionally Unmute
    ByteData _byte = await rootBundle.load(asset);
    fm.prepare(sf2: _byte);
  }
  @override
  void initState() {
    load('assets/sf2/Piano.SF2');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


