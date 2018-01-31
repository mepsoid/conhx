package conhx.core;

/**
 * Редактор строки ввода
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxEditor implements IConhxEditor {
	
	public function new(aTargetConsole:IConhxConsole) {
		mConsole = aTargetConsole;
		modeInsert();
		clear();
	}
	
	// IConhxEval //////////////////////////////////////////////////////////////
	
	/** Режим вставки символов */
	public function modeInsert() {
		mInsert = true;
	}
	
	/** Режим замены символов */
	public function modeOvertype() {
		mInsert = false;
	}
	
	/** Флаг пустой строки ввода */
	public var empty(get, null):Bool;
	inline function get_empty():Bool return mCommand.length == 0;
	
	/** Сбросить строку ввода */
	public function clear() {
		mCommand = "";
		mCursor = 0;
	}
	
	/** Задать строку ввода */
	public function set(aValue:String) {
		mCommand = aValue;
		mCursor = mCommand.length;
	}
	
	/** Курсор в начало */
	public function cursorHome() {
		mCursor = 0;
	}
	
	/** Курсор в конец */
	public function cursorEnd() {
		mCursor = mCommand.length;
	}
	
	/** Курсор на символ влево */
	public function cursorBack() {
		if (mCursor > 0)
			--mCursor;
	}
	
	/** Курсор на символ вправо */
	public function cursorForward() {
		if (mCursor < mCommand.length)
			++mCursor;
	}
	
	/** Добавить текст или символ в позицию курсора */
	public function textAdd(aText:String) {
		if (mCursor == mCommand.length)
			mCommand += aText;
		else if (mInsert)
			mCommand = mCommand.substr(0, mCursor) + aText + mCommand.substr(mCursor);
		else
			mCommand = mCommand.substr(0, mCursor) + aText + mCommand.substr(mCursor + aText.length);
		++mCursor;
	}
	
	/** Удалить символ за курсором */
	public function charDelete() {
		if (mCursor == mCommand.length)
			return;
		mCommand = mCommand.substr(0, mCursor) + mCommand.substr(mCursor + 1);
	}
	
	/** Удалить символ перед курсором */
	public function charBackspace() {
		if (mCursor == 0)
			return;
		mCommand = mCommand.substr(0, mCursor - 1) + mCommand.substr(mCursor);
		--mCursor;
	}
	
	/** Чистое представление команды */
	public function toString():String {
		return mCommand;
	}
	
	/** Представление команды для терминала */
	public function toTerm():String {
		return "\r" + mConsole.prompt + mCommand + " " + "\r" + mConsole.prompt + mCommand.substr(0, mCursor);
	}
	
	/** Строка для затирания команды в терминале */
	public function clearTerm():String {
		return "\r" + StringTools.rpad("", " ", mConsole.prompt.length + mCommand.length);
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	var mConsole:IConhxConsole;
	var mCommand:String;
	var mCursor:Int;
	var mInsert:Bool;
	
}