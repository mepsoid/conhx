package conhx.core;

import conhx.core.IConhxContext;

/**
 * Прототип команды
 * 
 * @version  1.0.1
 * @author   meps
 */
class CConhxCommandProto implements IConhxCommand {
	
	public function new() {
	}
	
	// IConhxCommand ///////////////////////////////////////////////////////////
	
	/** Имя команды */
	public var name(default, null):String;
	
	/** Краткое описание команды */
	public var helpBrief(default, null):String;
	
	/** Подробное описание команды */
	public var helpFull(default, null):String;
	
	/** Флаг выполнения команды; пока true команда продолжает выполняться */
	public var running(default, null):Bool;
	
	/** Код завершения команды; 0 выполнена без ошибок */
	public var code(default, null):Int;
	
	/** Передать окружение выполнения и запустить команду */
	public function run(aContext:IConhxContext) {
		mContext = aContext;
		running = true;
		code = 0;
		doStart();
	}
	
	/** Результат выполнения команды */
	public function output():String {
		if (code > 0) {
			// ошибка при выполнении команды
			running = false;
			return 'Error #$code!\n';
		}
		return doContinue();
	}
	
	/** Прервать выполнение команды */
	public function abort():String {
		return doAbort();
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	/** Начать выполнение команды; в обработчике команда только инициализируется */
	private function doStart() {
		// необязательно переопределять; по умолчанию инициализация команде не требуется
	}
	
	/** Продолжать выполнение команды; все команды выполняются в последовательных вызовах */
	private function doContinue():String {
		// обязательно к переопределению
		throw 'Override doContinue()!';
		return null;
	}
	
	/** Прервать выполнение команды */
	private function doAbort():String {
		// необязательно переопределять; по умолчанию команду прервать невозможно
		return '';
	}
	
	/** Завершить выполнение команды */
	private function doEnd(aCode:Int) {
		code = aCode;
		if (code == 0)
			// успешное завершение команды
			running = false;
	}
	
	////////////////////////////////////////////////////////////////////////////
	
	var mContext:IConhxContext;
	
}