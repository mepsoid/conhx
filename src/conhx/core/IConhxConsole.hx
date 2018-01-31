package conhx.core;

import conhx.core.IConhxCommand;

/**
 * Интерфейс рабочего окружения консоли
 * 
 * @version  1.0.1
 * @author   meps
 */
interface IConhxConsole {
	
	/** Флаг работающего окружения */
	var running:Bool;
	
	/** Код выполнения последней из команд */
	var code:Int;
	
	/** Приглашение ко вводу */
	var prompt:String;
	
	/** Итератор по именам команд */
	var commands(default, null):Iterator<String>;
	
	/** Итератор по алиасам */
	var aliases(default, null):Iterator<String>;
	
	/** Зарегистрировать команду */
	function commandAdd(aCommandClass:Class<IConhxCommand>):Void;
	
	/** Получить команду по ее имени или алиасу */
	function commandGet(aCommandName:String):IConhxCommand;
	
	/** Получить имя команды по алиасу */
	function aliasCommand(aAliasName:String):String;
	
	/** Добавить алиас для команды */
	function aliasAdd(aAliasName:String, aCommandName:String):Void;
	
	/** Удалить алиас по имени */
	function aliasRemove(aAliasName:String):Bool;
	
	/** Выбрать индекс для перебора истории команд; >0 с начала, <0 с конца */
	function historySelect(aIndex:Int = 0):Void;
	
	/** Перебирать историю с текущего индекса; null список завершен */
	function historyNext():String;
	
	/** Добавить строку истории в конец; полностью совпадающие строки не дублируются */
	function historyAdd(aLine:String):Void;
	
}