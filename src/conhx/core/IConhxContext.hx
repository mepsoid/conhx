package conhx.core;

/**
 * Интерфейс контекста выполнения команды
 * 
 * @version  1.0.1
 * @author   meps
 */
interface IConhxContext {
	
	/** Рабочее окружение команды */
	var console(default, null):IConhxConsole;
	
	/** Переданные в команду аргументы */
	function argumentGet(aIndex:Int):String;
	
}