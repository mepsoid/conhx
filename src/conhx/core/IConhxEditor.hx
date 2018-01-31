package conhx.core;

/**
 * Интерфейс интерпретатора командной строки
 * 
 * @version  1.0.1
 * @author   meps
 */
interface IConhxEditor {
	
	/** Режим вставки символов */
	function modeInsert():Void;
	
	/** Режим замены символов */
	function modeOvertype():Void;
	
	/** Флаг пустой строки ввода */
	var empty(get, null):Bool;
	
	/** Сбросить строку ввода */
	function clear():Void;
	
	/** Задать строку ввода */
	function set(aValue:String):Void;
	
	/** Курсор в начало */
	function cursorHome():Void;
	
	/** Курсор в конец */
	function cursorEnd():Void;
	
	/** Курсор на символ влево */
	function cursorBack():Void;
	
	/** Курсор на символ вправо */
	function cursorForward():Void;
	
	/** Добавить текст или символ в позицию курсора */
	function textAdd(aText:String):Void;
	
	/** Удалить символ за курсором */
	function charDelete():Void;
	
	/** Удалить символ перед курсором */
	function charBackspace():Void;
	
	/** Чистое представление команды */
	function toString():String;
	
	/** Представление команды для терминала */
	function toTerm():String;
	
	/** Строка для затирания команды в терминале */
	function clearTerm():String;
	
}