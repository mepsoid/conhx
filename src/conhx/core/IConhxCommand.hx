package conhx.core;

import conhx.core.IConhxContext;

/**
 * Интерфейс выполняемой команды
 * 
 * @version  1.0.1
 * @author   meps
 */
interface IConhxCommand {
	
	/** Имя команды */
	var name(default, null):String;
	
	/** Краткое описание команды */
	var helpBrief(default, null):String;
	
	/** Подробное описание команды */
	var helpFull(default, null):String;
	
	/** Флаг выполнения команды; пока true команда продолжает выполняться */
	var running(default, null):Bool;
	
	/** Код завершения команды; 0 выполнена без ошибок */
	var code(default, null):Int;
	
	/** Передать окружение выполнения и запустить команду */
	function run(aContext:IConhxContext):Void;
	
	/** Результат выполнения команды */
	function output():String;
	
	/** Прервать выполнение команды */
	function abort():String;
	
}