/*
		
		Author:		Desi Quintans <me@desiquintans.com>
		Website:		http://www.desiquintans.com/
		
		Script Function:
		
*/

#NoEnv
#Persistent
#SingleInstance, Force
#MaxHotkeysPerInterval, 200
SendMode Input
SetWorkingDir %A_ScriptDir%

#NoEnv
SetWorkingDir %A_ScriptDir%

FinalString := ""
Integer = 1
TimeStarted := A_TickCount

Loop, 100000
{
   Counter = 0
   int := Integer
   
   While (int != 1 && Counter != 8)
   {
      Counter += 1
      Loop, Parse, int
         Result += A_LoopField**2
      int := Result
      Result = 0
   }
   
   if (int == 1)
      FinalString .= "[" . Counter . "] " . Integer . "`n"
      
   Integer += 1
}

TimeElapsed := A_TickCount-TimeStarted

FileAppend, %FinalString%, happy.txt
SecondsElapsed :=TimeElapsed/1000

MsgBox Done!`nTook %SecondsElapsed% seconds (%TimeElapsed% milliseconds).