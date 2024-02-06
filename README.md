#this code handle when user added or change

:global EventHandler do={/log info "Eng-osamah-Event username=$Name changed";:return 0;}
/ip hotspot user print follow-only where [$EventHandler Name=$name];

#Know Try to Add New User manually and go to see the log :)
#please Be Creative ;) And Thank me Later hhhhhhhhhh


#this code handle when New Client Added to host or change to Active

:global EventHandler do={/log info "Eng-osamah-Event New Host Added the IP=$Address";:return 0;}
/ip hotspot host print follow-only where [$EventHandler Address=$address];

And So On ......

my Account FaceBook 
https://www.fb.com/osamahfarhan
