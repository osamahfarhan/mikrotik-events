# MikroTik Scripts

MikroTik RouterOS based Scripts, Events Handler , Tips and Tricks

## In this repo...

- [Scripting examples](https://help.mikrotik.com/docs/display/ROS/Scripting+examples?src=contextnavpagetreemode)
  - [Detectnewlogentry](https://help.mikrotik.com/docs/display/ROS/Scripting+examples#Scriptingexamples-Detectnewlogentry)

-  (Mikrotik v7 scripts).
-  (Mikrotik v6 scripts).
```RouterOS Script

/system logging action add name="pppoeEvent" target=memory memory-lines=100;

/system logging add action=pppoeEvent topics=pppoe,info,!ppp,!debug;

/system script add name=pppoeEvent source={
:global eventsKill;
:global eventHistory [:toarray ""];
:global eventHistoryLength 10;
:global eventsHandler [:toarray ""];
:set ($eventsHandler->"pppoeEvent") do={
:global eventHistory;
:global eventHistoryLength;

# do any thing ; like save messeges 

:local length [:len $eventHistory];
:if ($length >= $eventHistoryLength && $length>0) do={:set $eventHistory [:pick $eventHistory 1 $length];:set $length ($length-1);};

:set ($eventHistory->$length) ({"time"=$eventTime;"message"=$eventMessage});
/log info ("pppoeEvent",$eventTime,$eventMessage);

# return to stop execute the next function on array ; 
:return (false);
};

/log info "Events : Start Lessening pppoeEvent";

/log print follow where [[($eventsHandler->$buffer) eventTime=$time eventMessage=$message];[$eventsKill]];

};

/system script add name=pppoeStopEvent source={
:global eventsHandler;

/log warning "Events : Stop pppoeEvent";

:set ($eventsHandler->"pppoeEvent") do={:quit ;}

};
/system script add name=eventsKill source={
:global eventsKill;
:set $eventsKill do={:quit ;}
/log warning "Events : kill all events";
};

```

#### More MikroTik scripts by Osamah A.F Ali

- [Mikrotik Scripts](https://github.com/osamahfarhan/mikrotik)

# Contact

https://www.facebook.com/osamahfarhan

# Examples

##this function runs when new user added or change on hotspot user

```RouterOS Script

:global EventHandler do={/log info "Eng-osamah-Event username=$Name changed";:return 0;};

/ip hotspot user print follow-only where [$EventHandler Name=$name];

```
##now Try to Add New User manually and go to see the log :)

##this code handle when New Client Added to host or change to Active

```RouterOS Script

:global EventHandler do={/log info "Eng-osamah-Event New Host Added the IP=$Address";:return 0;};

/ip hotspot host print follow-only where [$EventHandler Address=$address];

```
