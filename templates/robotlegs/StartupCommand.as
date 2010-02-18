/*

Copyright (c) @year@ @company.name@, All Rights Reserved 

@author   @author.name@
@contact  @author.email@
@project  @project.name@

@internal 

*/
package @namespace@.controller 
{
	import flash.utils.describeType;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	
	import org.osflash.thunderbolt.ThunderBoltTarget;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	/**
	 *
	 * Defines the associated <code>Command</code> implementation for 
	 * the user gesture.
	 *
	 * <p>
	 * Commands are stateless, short-lived objects used to perform a single unit of work within an application. 
	 * Commands are appropriate for communication between application tiers and are able to send 
	 * system events that will either launch other Commands or be received by a Mediator to perform 
	 * work on a View Component in response to the event. Commands are an excellent place to encapsulate 
	 * the business logic of your application.
	 * </p>
	 *
	 * @see org.robotlegs.mvcs.Command
	 *
	 */
	public final class @gesture@Command extends Command 
	{
		/**
		 * Create variable to point to this class. 
		 * 
		 * @private
		 *
		 */     	
		private var logger:ILogger = Log.getLogger(describeType(this).@name.split("::").join("."));
		
		/**
		 *
		 * Define an instance of <code>ThunderBoltTarget</code>
		 *
		 * @see org.osflash.thunderbolt.ThunderBoltTarget
		 * @see mx.logging.Log
		 *
		 */
		private var _target: ThunderBoltTarget = new ThunderBoltTarget();
		
		/**
		 *
		 * Method handle the logic for <code>@gesture@Command</code>
		 *
		 */        
		override public function execute():void    
		{
			// logging command to logging API
			logger.info("execute");        	
			
			// Inject thunderbolt into the built-in logging API
			_target.filters = ["@namespace@.*"];
			Log.addTarget(_target); 
			
			// Do some custom startup stuff here!
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}