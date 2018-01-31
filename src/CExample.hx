package;

import conhx.commands.*;
import conhx.core.CConhxConsole;
import cpp.Lib;

/**
 * Пример использования библиотеки
 * 
 * @version  1.0.1
 * @author   meps
 */
class CExample {
	
	static function main() {
		var env = new CConhxConsole();
		
		trace(env.commandGet("alias").helpBrief);
		
		var n = 0;
		for (a in 5...52)
			for (b in 4...a)
				for (c in 3...b)
					for (d in 2...c)
						for (e in 1...d)
							++n;
		trace(n);
	}
	
}