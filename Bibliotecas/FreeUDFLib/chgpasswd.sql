/*
BEGIN WARNING SECTON

   What you are about to do works, but it is ENTIRELY unsupported
   by Borland!

   This is also ENTIRELY UNSUPPORTED BY ME!!!!

   I have tested this with IB 4.2 and it works just fine, but I'm just
   warning you that you had better know what you are doing if you are
   going to run this!

   This is A BIG FAT UNSUPPORTED WARNING!!!!!

   DON'T DO THIS IF YOU WANT BORLAND SUPPORT FOR YOUR ISC4 FILE!!!

   Now that I've warned you....

   ANOTHER BIG FAT WARNING:

   Although IB is not known as the most secure DB in the industry,
   this _could_ make your system less secure than it already
   is. Conceptually, it is not a problem allowing a user to change
   his/her own password; however, I can't make any guarantees that
   my script below doesn't open any gaps to allow unwanted intruders
   in.

   Once again, I am just warning you that you had better understand
   the underlying code before you use it; otherwise, you risk getting
   _yourself_ into trouble, and you CANNOT BLAME ME OR BORLAND OR
   ANYBODY ELSE BUT YOURSELF!

   I know that my disclaimer of any express or implied warranties,
   guarantees, or fitness for a particular use has been verbose, but
   it is absolutely essential that you understand that messing around
   with known methods for maintaining user names and passwords is
   DANGEROUS.

   With all that said here you go...

END WARNING SECTON

   Change the DB name, user and password appropriately below, and the
   script should run just fine...

   After all is said and done, users should be able to change only
   their own passwords using the "ChangePassword" procedure, and
   SYSDBA should be able to ADD/DELETE/Change user's using the three
   procedures below. */

connect "c:\Program Files\Borland\IntrBase\Isc4.gdb"
  user "SYSDBA"
  password "masterkey";

declare external function f_IBPassword
  cstring(32)
  returns
  cstring(32)
  entry_point "IBPassword" module_name "FreeUDFLib.dll";

create exception exc_not_permitted "Action not permitted";

set term ^ ;

create procedure AddUser
 (user_name varchar(128), passwd varchar(32))
 as
  begin
    if ((USER != "SYSDBA") or
        (:user_name is null) or
        (:user_name = "") or
        (:passwd is null) or
        (:passwd = "")) then
      exception exc_not_permitted;

    insert into users (user_name, passwd)
      values (UPPER(:user_name), f_IBPassword(:passwd));
  end ^

create procedure ChangePassword
 (user_name varchar(128), passwd varchar(32))
 as
  begin
    if (((USER != "SYSDBA") and (USER != :user_name)) or
        (:user_name is null) or
        (:user_name = "") or
        (:passwd is null) or
        (:passwd = "")) then
      exception exc_not_permitted;

    update users
      set passwd = f_IBPassword(:passwd)
      where user_name = UPPER(:user_name);
  end ^
    
create procedure DeleteUser
 (user_name varchar(128))
 as
  begin
    if ((USER != "SYSDBA") or
        (:user_name is null) or
        (:user_name = "")) then
      exception exc_not_permitted;

    delete from users
      where user_name = UPPER(:user_name);
  end ^

set term ; ^

grant execute on procedure ChangePassword to public;
grant update (passwd) on users to procedure ChangePassword;

exit;

