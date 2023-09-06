# Build Script 2

---

Created By Kevin Edmond

Repository for Build Script 2: Initiate and complete an ssh connection or scp file copy connection to a remote host.

### Instructions:

1. Configure key-based authentication to the remote server. Guide to setting up [key-based authentication](https://www.redhat.com/sysadmin/key-based-authentication-ssh).

2. Set permissions to allow the script to be executable.
   > command: `sudo chmod 775 /home/<username>/build_script_2.sh`

### Script Logic:

1. Prompt the user to select a remote connection option between ssh or scp.

   > `1: ssh`<br> `2: scp`<br> `Enter Number: `<br>

2. Prompt the user to enter the <em>remote host username</em>.

   > `Enter remote connection username...`<br> > `Enter Username: `<br>

3. Prompt the user to enter the <em>remote host IP address</em>.

   > `Enter remote connection IP Address...`<br> `Enter IP Address: `<br>

4. Based on the user's initial selection, a ssh scp connection will be initiated.

   1. For **ssh** selection, the ssh connection will be initiated using the the captured user input.

   > `ssh <remote host username>@<remote host IP address>`

   2. For **scp** selection, some addtional user iput will be needed.

   - Prompt the user to enter the <em>connection direction</em>.

     > `local: Remote -> Local`<br> `remote: Local -> Remote`<br> `Connection Direction: `<br>

   - Prompt the user to enter the <em>source file path</em>.

     > `Enter source file path and filename (filepath/filename)...`<br> `Enter file path/filename: `<br>

   - Prompt the user to enter the <em>destination path</em>. An empty destination path will default to the destination user's home directory.

     > `Enter destination path and (optional: filename)...`<br> `Enter file path/filename: `<br>

   - Check the connection direction entered by the user.

     - If local, initiate a remote to local scp connection.

       > `scp <remote host username>@<remote host IP address>:<source file path> <destination path>`

     - If remote, initiate a local to remote scp connection.
       > `scp <source file path> <remote host username>@<remote host IP address>:<destination path>`
