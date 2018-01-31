package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Вывод текста в консоль
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxEcho extends CConhxCommandProto implements IConhxCommand {
	
	public function new() {
		super();
		name = 'echo';
		helpBrief = 'Prints text to console';
		helpFull =
			'$name -- Prints new line;\n' +
			'$name <text> -- Prints specified text;\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doContinue():String {
		var result = '', index = 0, args:String;
		while (null != (args = mContext.argumentGet(index++)))
			result += args + ' ';
		
		doEnd(0);
		return result + '\n';
	}
	
}