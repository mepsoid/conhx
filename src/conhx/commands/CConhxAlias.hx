package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Команда управления алиасами
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxAlias extends CConhxCommandProto implements IConhxCommand {
	
	public function new() {
		super();
		name = 'alias';
		helpBrief = 'Management of commands aliases';
		helpFull =
			'$name -- show list of all aliases;\n' +
			'$name <alias> -- remove existing alias;\n' +
			'$name <alias> <command> -- add new alias for command;\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doContinue():String {
		var alias = mContext.argumentGet(0);
		var command = mContext.argumentGet(1);
		
		if (alias == null) {
			var result = 'Aliases:\n';
			for (alias in mContext.console.aliases)
				result += '  $alias: $(mContext.console.aliasCommand(alias))\n';
			doEnd(0);
			return result;
		}
		
		if (command == null) {
			if (mContext.console.aliasRemove(alias)) {
				doEnd(0);
				return 'Alias $alias removed\n';
			}
			doEnd(1);
			return 'Alias $alias not found\n';
		}
		
		mContext.console.aliasAdd(alias, command);
		doEnd(0);
		return 'Alias $alias assigned to command $command\n';
	}
	
}