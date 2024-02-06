#this code handle when user added or change

:global EventHandler do={/log info "Eng-osamah-Event username=$Name changed";:return 0;};

/ip hotspot user print follow-only where [$EventHandler Name=$name];

#Know Try to Add New User manually and go to see the log :)
#please Be Creative ;) And Thank me Later hhhhhhhhhh
