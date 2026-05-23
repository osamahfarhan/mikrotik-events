:global ReName ("google");
:global ListName ("GOOGLE_LIST");
/ip dns cache all print follow where [
:if (name~"$ReName") do={
:if (type="CNAME" or  type="A") do={
:local a $data;:local n $name;:if (type="CNAME") do={:set $a $name;};
:put ("name=$n    data=$a     ");
:do {/ip firewall address-list add list=$ListName comment=$n address=$a} on-error={};
}};(false)];
