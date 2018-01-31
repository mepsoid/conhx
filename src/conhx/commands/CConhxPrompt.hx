package conhx.commands;

import conhx.core.CConhxCommandProto;
import conhx.core.IConhxCommand;

/**
 * Команда смены приглашения ко вводу
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxPrompt extends CConhxCommandProto implements IConhxCommand {
	
	public function new() {
		super();
		name = 'prompt';
		helpBrief = 'Changes prompt';
		helpFull =
			'$name -- Sets default prompt;\n' +
			'$name <prompt> -- Sets desired prompt;\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	override function doStart() {
		if (mDefaultPrompt == null)
			mDefaultPrompt = mContext.console.prompt;
	}
	
	override function doContinue():String {
		var prompt = mContext.argumentGet(0);
		if (prompt == null) {
			mContext.console.prompt = mDefaultPrompt;
			doEnd(0);
			return 'Default prompt have been set\n';
		}
		
		mContext.console.prompt = prompt;
		doEnd(0);
		return 'Prompt changed to $prompt\n';
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	var mDefaultPrompt:String;
	
}