link:https://askubuntu.com/questions/162391/how-do-i-fix-my-locale-issue
First run locale to list what locales currently defined for the current user account:

$ locale
LANG=C
LANGUAGE=
LC_CTYPE=fi_FI.UTF-8
LC_NUMERIC="C"
LC_TIME="C"
LC_COLLATE=fi_FI.UTF-8
LC_MONETARY="C"
LC_MESSAGES=fi_FI.UTF-8
LC_PAPER="C"
LC_NAME="C"
LC_ADDRESS="C"
LC_TELEPHONE="C"
LC_MEASUREMENT="C"
LC_IDENTIFICATION="C"
LC_ALL=
Then generate the missing locale and reconfigure locales to take notice:

$ sudo locale-gen "en_US.UTF-8"
Generating locales...
  en_US.UTF-8... done
Generation complete.

$ sudo dpkg-reconfigure locales
Generating locales...
  en_US.UTF-8... up-to-date
Generation complete.
Now you will not see any errors anymore!
