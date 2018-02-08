$When = ((Get-Date).AddMinutes(-1)).Date
$user = Get-ADUser -Filter {whenCreated -ge $When} -Properties whenCreated

if($user){
	$date = Get-Date
	$sh = new-object -comobject wscript.shell
	$msg = $sh.popup(("We found a new user " + $user + " at " + $date + "!"),0,"YOU CAN WIN!",0)
}
