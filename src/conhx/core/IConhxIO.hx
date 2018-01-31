package conhx.core;

/**
 * Интерфейс ввода вывода
 * 
 * @version  1.0.1
 * @author   meps
 */
interface IConhxIO {
	
	/** Вывести строку */
	function write(aData:String):Void;
	
	/** Прочитать код символа */
	function read():ESymbolCode;
	
}

enum ESymbolCode {
	Up;
	Down;
	Left;
	Right;
	Home;
	End;
	PageUp;
	PageDown;
	Escape;
	Tab;
	Backspace;
	Delete;
	Insert;
	Enter;
	Ctrl_A;
	Ctrl_B;
	Ctrl_C;
	Ctrl_D;
	Ctrl_E;
	Ctrl_F;
	Char(code:Int);
}
