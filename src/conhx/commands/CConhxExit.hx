package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Дескриптор команды выхода
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxExit extends CConhxCommandProto implements IConhxCommand {
	
	public function new() {
		super();
		name = 'exit';
		helpBrief = 'Leaves console';
		helpFull =
			'$name [<code>] -- Leave console with result code (0 by default);\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doContinue():String {
		var code = Std.parseInt(mContext.argumentGet(0));
		if (code == null)
			code = 0;
		mContext.console.running = false;
		doEnd(code);
		return 'Bye!\n';
	}
	
}