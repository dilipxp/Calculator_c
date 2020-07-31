import 'package:flutter/material.dart';
import 'package:calculator_c/key-controller.dart';
import 'package:calculator_c/key-symbol.dart';
import 'dart:math';
//import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class Keys {

	static KeySymbol clear = const KeySymbol('C');
	static KeySymbol sign = const KeySymbol('±');
	static KeySymbol percent = const KeySymbol('%');
	static KeySymbol divide = const KeySymbol('÷');
	static KeySymbol multiply = const KeySymbol('x');
	static KeySymbol subtract = const KeySymbol('-');
	static KeySymbol add = const KeySymbol('+');
	static KeySymbol equals = const KeySymbol('=');
	static KeySymbol decimal = const KeySymbol('.');

	static KeySymbol zero = const KeySymbol('0');
	static KeySymbol one = const KeySymbol('1');
	static KeySymbol two = const KeySymbol('2');
	static KeySymbol three = const KeySymbol('3');
	static KeySymbol four = const KeySymbol('4');
	static KeySymbol five = const KeySymbol('5');
	static KeySymbol six = const KeySymbol('6');
	static KeySymbol seven = const KeySymbol('7');
	static KeySymbol eight = const KeySymbol('8');
	static KeySymbol nine = const KeySymbol('9');
}

class CalculatorKey extends StatelessWidget {

	CalculatorKey({ this.symbol });

	final KeySymbol symbol;
	
	Color get color {

		switch (symbol.type) {

			case KeyType.FUNCTION:

				//var randomizer = new Random();         // can get a seed as a parameter
				//var col1 = randomizer.nextInt(70);    // Integer between 0 and 100 (0 can be 100 not)
				//var col2 = randomizer.nextInt(70);
				//var col3 = randomizer.nextInt(70);
				//var col4 = randomizer.nextInt(70)
				return Color.fromARGB(255, 34, 94, 94);

			case KeyType.OPERATOR:
				//var randomizer = new Random();         // can get a seed as a parameter
				//var col1 = randomizer.nextInt(50);    // Integer between 0 and 100 (0 can be 100 not)
				//var col2 = randomizer.nextInt(50);
				//var col3 = randomizer.nextInt(50);
				//var col4 = randomizer.nextInt(50);
				return Color.fromARGB(255, 34, 65, 94);

			case KeyType.INTEGER:
			default:
			var randomizer = new Random();         // can get a seed as a parameter
			var col1 = randomizer.nextInt(255);    // Integer between 0 and 100 (0 can be 100 not)
			var col2 = randomizer.nextInt(255);
			var col3 = randomizer.nextInt(255);
			var col4 = randomizer.nextInt(255);
			return Color.fromARGB(col1, col2, col3, col4);
		}
	}

	static dynamic _fire(CalculatorKey key) => KeyController.fire(KeyEvent(key));

	@override
	Widget build(BuildContext context) {

		double size = MediaQuery.of(context).size.width / 4;
		TextStyle style = Theme.of(context).textTheme.headline4.copyWith(color: Colors.white);

		return Container(
			
			width: (symbol == Keys.zero) ? (size * 2) : size,
			padding: EdgeInsets.all(2),
			height: size,
			child: RaisedButton(
				shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
				color: color,
				elevation: 4,
				child: Text(symbol.value, style: style),
				onPressed: () => _fire(this),
			)
		);
	}
}