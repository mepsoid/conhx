package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Команда работы с историей
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxHistory extends CConhxCommandProto implements IConhxCommand{
	
	public function new() {
		super();
		name = "history";
		helpBrief = "Shows command history";
		helpFull =
			'$name -- shows all history;\n' +
			'$name <count> -- shows last <count> commands;\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doContinue():String {
		var count = Std.parseInt(mContext.argumentGet(0));
		if (count == null)
			mContext.console.historySelect();
		else
			mContext.console.historySelect(-count);
		
		var result = 'History:\n', index = 1, line:String;
		while (null != (line = mContext.console.historyNext())) {
			result += '  $index: $line\n';
			++index;
		}
		
		doEnd(0);
		return result;
	}
	
}