import 'dart:io';
import 'package:dart_cli_tools_demo/scanner.dart';

class Demo {

	static void hello(String name) => print("hello ${name}!");

	static void usage() => print("usage: main.dart [ hello | scan {dirname} ]");

	static void parse(List<String> args) {


		try {		
			switch (args[0]) {

				case 'hello':
					return Demo.hello(Platform.localHostname);

				case 'scan':
					return (args[1] != null) ? Scanner.scan(args[1]) : Demo.usage();
				
				default: 
					return Demo.usage();
			}
		} 
		catch(Exception) { Demo.usage(); }
	}
}