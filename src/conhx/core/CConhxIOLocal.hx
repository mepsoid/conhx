package conhx.core;

import conhx.core.IConhxIO;
import haxe.ds.IntMap;

/**
 * Ввод с клавиатуры и вывод на экран
 * 
 * @link     http://eastmanreference.com/complete-list-of-applescript-key-codes/
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxIOLocal implements IConhxIO {
	
	public function new() {
		mKeyCodes = new IntMap();
		mWinFlag = Sys.systemName() == "Windows";
		if (mWinFlag) {
			mControlKey = 224;
			mKeyCodes.set( 72, ESymbolCode.Up);
			mKeyCodes.set( 80, ESymbolCode.Down);
			mKeyCodes.set( 75, ESymbolCode.Left);
			mKeyCodes.set( 77, ESymbolCode.Right);
			mKeyCodes.set( 71, ESymbolCode.Home);
			mKeyCodes.set( 79, ESymbolCode.End);
			mKeyCodes.set( 73, ESymbolCode.PageUp);
			mKeyCodes.set( 81, ESymbolCode.PageDown);
			mKeyCodes.set( 27, ESymbolCode.Escape);
			mKeyCodes.set(  9, ESymbolCode.Tab);
			mKeyCodes.set(  8, ESymbolCode.Backspace);
			mKeyCodes.set( 83, ESymbolCode.Delete);
			mKeyCodes.set( 82, ESymbolCode.Insert);
			mKeyCodes.set( 13, ESymbolCode.Enter);
			mKeyCodes.set(  1, ESymbolCode.Ctrl_A);
			mKeyCodes.set(  2, ESymbolCode.Ctrl_B);
			mKeyCodes.set(  3, ESymbolCode.Ctrl_C);
			mKeyCodes.set(  4, ESymbolCode.Ctrl_D);
			mKeyCodes.set(  5, ESymbolCode.Ctrl_E);
			mKeyCodes.set(  6, ESymbolCode.Ctrl_F);
		} else {
			mControlKey = 27; // ??? = Esc
			mKeyCodes.set( 65, ESymbolCode.Up);
			mKeyCodes.set( 66, ESymbolCode.Down);
			mKeyCodes.set( 68, ESymbolCode.Left);
			mKeyCodes.set( 67, ESymbolCode.Right);
			mKeyCodes.set( 72, ESymbolCode.Home);
			mKeyCodes.set( 70, ESymbolCode.End);
			//mKeyCodes.set(, ESymbolCode.PageUp);
			//mKeyCodes.set(, ESymbolCode.PageDown);
			mKeyCodes.set( 27, ESymbolCode.Escape);
			//mKeyCodes.set(, ESymbolCode.Tab);
			mKeyCodes.set(127, ESymbolCode.Backspace);
			//mKeyCodes.set(, ESymbolCode.Delete);
			mKeyCodes.set( 82, ESymbolCode.Insert);
			mKeyCodes.set( 13, ESymbolCode.Enter);
			mKeyCodes.set(  1, ESymbolCode.Ctrl_A);
			mKeyCodes.set(  2, ESymbolCode.Ctrl_B);
			mKeyCodes.set(  3, ESymbolCode.Ctrl_C);
			mKeyCodes.set(  4, ESymbolCode.Ctrl_D);
			mKeyCodes.set(  5, ESymbolCode.Ctrl_E);
			mKeyCodes.set(  6, ESymbolCode.Ctrl_F);
		}
	}
	
	public function write(aData:String) {
		Sys.print(aData);
	}
	
	public function read():ESymbolCode {
		var code = Sys.getChar(false);
		var type:ESymbolCode;
		if (code == mControlKey || code == 0) {
			if (!mWinFlag)
				// вычитать дополнительный код
				Sys.getChar(false);
			code = Sys.getChar(false);
			type = mKeyCodes.get(code);
		} else {
			if (code >= 32 && code <= 126)
				type = ESymbolCode.Char(code);
			else
				type = mKeyCodes.get(code);
		}
		return type;
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	var mKeyCodes:IntMap<ESymbolCode>;
	var mControlKey:Int;
	var mWinFlag:Bool;
	
}