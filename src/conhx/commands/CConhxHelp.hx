package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Команда вывода описаний других команд
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxHelp extends CConhxCommandProto implements IConhxCommand {	
	
	public function new() {
		super();
		name = 'help';
		helpBrief = 'Shows description of the commands';
		helpFull =
			'$name -- Shows list of all available commands with brief description;\n' +
			'$name <command> -- Shows full description of desired command;\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doContinue():String {
		var full = mContext.argumentGet(0);
		if (full == null) {
			var result = 'Known commands:\n';
			for (name in mContext.console.commands) {
				var command = mContext.console.commandGet(name);
				result += '$name - $(command.helpBrief)\n';
			}
			doEnd(0);
			return result;
		}
		
		var command = mContext.console.commandGet(full);
		if (command == null) {
			doEnd(1);
			return 'Command $full not found\n';
		}
		
		doEnd(0);
		return '$full:\n$(command.helpFull)';
	}
	
}