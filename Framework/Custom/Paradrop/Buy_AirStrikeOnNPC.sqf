//////////////////////////////////////////////////////////////////
//	"addAction to buy xxxxx" CLIENT side, {|||TNA|||}WAKeupneo, www.tna-community.com
//	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
//	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
//////////////////////////////////////////////////////////////////
if (alive (player)) then  
{ 
  private _target = player;

  _target addAction [  
  "<t color='#ff0033'>Call AirStrike for 8999 $</t>",
 { 
  	private _TargetAction = (_this select 1);
    private _amount = 8999;
    private _mission = 001; 
	_TargetAction removeaction ((_this select 2)+1); 
	_TargetAction removeaction (_this select 2);
		_lockerMoney = _TargetAction getVariable ['ExileLocker', 0];
    if(_lockerMoney > _amount) then
    { 
      _TargetAction removeaction (_this select 2); 
      _TargetAction removeaction (actionIDs _TargetAction select 17);
      [_TargetAction,_amount,_mission] remoteexec ["WMS_fnc_Pull_BUY_Push",2];
      systemChat "Lockers poptabs Updated";
    } else {
     systemChat "Nope! you are too poor!";
     ["ErrorTitleOnly", ["Dude! get some money!"]] call ExileClient_gui_toaster_addTemplateToast;
    }
 }  
 ];

 _target addAction [   
 "<t color='#33ff00'>Nope, thanks</t>",    
 {  
	private  _TargetAction = (_this select 1); 
	_TargetAction removeaction (_this select 2);
	_TargetAction removeaction ((_this select 2)-1); 
 }  
 ]; 
} else {systemchat "you dead Bro :/"};