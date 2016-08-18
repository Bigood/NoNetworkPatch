##Prevent network usage of an app on OS X

Use these shell scripts to prevent an OS X app for using outgoing and ingoing network, like Little Snitch or a 2 way firewall would have done.

This uses [Buckleup](https://github.com/hellais/Buckle-Up) to patch the app permanently.


###Usage

To patch a file :

1- `$ sudo chmod -R +x .`
2- `$ ./patch.sh COMPLETE_PATH_TO_YOUR_APP`

To unpatch it :

1- Check it's already patched in patched_apps.txt
2- `$ ./unpatch.sh COMPLETE_PATH_TO_YOUR_APP`


###Advance usage

To generate a Seatbelt for an app, use generate_sb.sh : 

`$ ./generate_sb.sh COMPLETE_PATH_TO_YOUR_APP`

Then use buckleup.py directly to patch it


###Note 

From OS X 10.11, sandbox-simplify is no longer on /usr/bin ; if you need to generate some .sb, copy it from ./bin.
