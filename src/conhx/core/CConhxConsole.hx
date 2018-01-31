package conhx.core;

import conhx.commands.*;
import conhx.core.CConhxEditor;
import conhx.core.IConhxCommand;
import haxe.ds.StringMap;

/**
 * Рабочее окружение консоли
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxConsole implements IConhxConsole {
	
	public function new() {
		mCommands = new StringMap();
		mAliases = new StringMap();
		mHistory = new Array();
		
		// встроенные команды
		commandAdd(CConhxAlias);
		commandAdd(CConhxEcho);
		commandAdd(CConhxExit);
		commandAdd(CConhxHelp);
		commandAdd(CConhxHistory);
		commandAdd(CConhxPrompt);
		
		mInputOutput = new CConhxIOLocal();
		mEditor = new CConhxEditor(this);
		
		while (true) {
			var code = mInputOutput.read();
			if (code != null)
				mInputOutput.write(switch (code) {
					case Char(charCode):
						charCode + ':' + String.fromCharCode(charCode) + '\n';
					default:
						Std.string(code) + '\n';
				});
			
			
		}
	}
	
	// IConhxConsole ///////////////////////////////////////////////////////////
	
	/** Флаг работающего окружения */
	public var running:Bool = true;
	
	/** Код выполнения последней из команд */
	public var code:Int = 0;
	
	/** Приглашение ко вводу */
	public var prompt:String = PROMPT;
	
	/** Итератор по именам команд */
	public var commands(default, null):Iterator<String>;
	inline function get_commands():Iterator<String> return mCommands.keys();
	
	/** Итератор по алиасам */
	public var aliases(default, null):Iterator<String>;
	inline function get_aliases():Iterator<String> return mAliases.keys();
	
	/** Зарегистрировать команду */
	public function commandAdd(aCommandClass:Class<IConhxCommand>) {
		var command:IConhxCommand = Type.createInstance(aCommandClass, null);
		mCommands.set(command.name, command);
	}
	
	/** Получить команду по ее имени или алиасу */
	public function commandGet(aCommandName:String):IConhxCommand {
		var name = mAliases.get(aCommandName);
		return mCommands.get(name != null ? name : aCommandName);
	}
	
	/** Получить имя команды по алиасу */
	public function aliasCommand(aAliasName:String):String {
		return mAliases.get(aAliasName);
	}
	
	/** Добавить алиас для команды */
	public function aliasAdd(aAliasName:String, aCommandName:String) {
		mAliases.set(aAliasName, aCommandName);
	}
	
	/** Удалить алиас по имени */
	public function aliasRemove(aAliasName:String):Bool {
		return mAliases.remove(aAliasName);
	}
	
	/** Выбрать индекс для перебора истории команд; >0 с начала, <0 с конца */
	public function historySelect(aIndex:Int = 0) {
		aIndex = aIndex < 0 ? mHistory.length + aIndex : aIndex;
		if (aIndex < 0)
			aIndex = 0;
		mHistoryIndex = aIndex;
	}
	
	/** Перебирать историю с текущего индекса; null список завершен */
	public function historyNext():String {
		if (mHistoryIndex >= mHistory.length)
			return null;
		return mHistory[mHistoryIndex++];
	}
	
	/** Добавить строку истории в конец; полностью совпадающие строки не дублируются */
	public function historyAdd(aLine:String) {
		var length = mHistory.length;
		if (length == 0 || mHistory[length - 1] != aLine)
			mHistory.push(aLine);
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	var mCommands:StringMap<IConhxCommand>;
	var mAliases:StringMap<String>;
	var mHistory:Array<String>;
	var mHistoryIndex = 0;
	
	var mInputOutput:IConhxIO;
	var mEditor:IConhxEditor;
	
	static inline var PROMPT = '> ';
	
}