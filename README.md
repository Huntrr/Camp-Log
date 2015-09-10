# Camp Log (sign in/out!)

The summer camp I worked at over the summer has a huge problem. Currently, when
staff want to sign on or off camp, they need to sift through these boxes full of
index cards (sorted *loosely* by name), cross their fingers and hope they can
find their card and then, if all that went well, find a pen to write that
they’re signing out recording the time in whatever non-standardized form they
want. The whole system was badly disorganized, and it took way too long to sign
out and sign in.

It needed to be redone. And this is the redo.

It’s a reactive Meteor app that solves all of the problems of the current
iteration. Users can log in (either to the ‘log’ account or to the ‘admin’
account depending on whether or not they want to be able to DELETE data rather
than just add to it) and then signing in and out is as simple as typing a name
and clicking the button. New users are added in a snap, and the system is smart
enough to keep track of the time and know whether your signing in or out. It
even keeps a log of all your sign-outs which it can display on demand. Overall
super clean, super easy, super simple.

## Login details

Want to try it out on your own machine? The default login details (defined in
/server/startup.coffee) are as follows:

*User:* log | *Password:* password

*User:* admin | *Password:* securepassword
