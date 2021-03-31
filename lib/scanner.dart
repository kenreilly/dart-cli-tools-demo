import 'dart:io';

class Scanner {

	int files = 0;
	int size = 0;

	static void scan(String path) async {

		Scanner scanner = Scanner();
		await scanner._traverse(path); 
		print ("\n total files: " + scanner.files.toString() + "");
		print (" total size: " + scanner.size.toString() + " bytes");
	}

	Future<void> _traverse(String path) async {

		print("\n  " + path + "/");

		try {
			
			Directory dir = Directory(path);
			Stream<FileSystemEntity> items = dir.list();
			
			await for (FileSystemEntity f in items) {
				(f is Directory) ? await _traverse(f.path) : await _stat(f as File);
			}
		}
		catch (e) { print(e.toString()); }
	}

	Future<void> _stat(File f) async {
		
		int filesize = await f.length();
		size += filesize;
		files += 1;

		String out = f.path.padLeft(f.path.length + 4);
		print(out + " " + filesize.toString() + " bytes");
	}
}