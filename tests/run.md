# Run approved executable

Run an executable if it is approved.

	$ mkdir -p {tiva_log/output,"tiva_share/public keys"}
	$ openssl genrsa > user.private.key 2> /dev/null
	$ openssl pkey -in user.private.key -pubout > "tiva_share/public keys/user.public.key"
	$ echo "echo 'output'" > executable.sh
	$ chmod a+x executable.sh

It is not executed if not approved.

	$ $lib_dir/run tiva_share/ tiva_log/ $lib_dir/ executable.sh 2> stderr.log
	$ cat stderr.log
	< File executable.sh is not approved.

Approve executable and execute it.

	$ openssl dgst -sha1 -sign user.private.key executable.sh > executable.sh.user.signature
	$ $lib_dir/run tiva_share/ tiva_log/ $lib_dir/ executable.sh
	$ cat tiva_log/1.executable.sh
	< echo 'output'
	$ cat tiva_log/output/1.out
	< output

Each time an executable runs, the id is increased.

	$ $lib_dir/run tiva_share/ tiva_log/ $lib_dir/ executable.sh
	$ cat tiva_log/2.executable.sh
	< echo 'output'
	$ cat tiva_log/output/2.out
	< output
