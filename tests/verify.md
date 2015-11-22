# Verify signatures

The verification script will print every valid signatures.

First, create keys for test user and the message.

	$ mkdir -p "tiva/public keys"
	$ openssl genrsa > user.private.key 2> /dev/null
	$ openssl pkey -in user.private.key -pubout > "tiva/public keys/user.public.key"
	$ echo "Test message." > message.txt

Before the user sign the message, the script will output nothing.

	$ $lib_dir/verify tiva/ message.txt | wc -l
	< 0

After the signature, the script will output the username.

	$ openssl dgst -sha1 -sign user.private.key message.txt > message.txt.user.signature
	$ $lib_dir/verify tiva/ message.txt
	< user

A valid signature must have a public key on tiva directory.

	$ openssl genrsa > user2.private.key 2> /dev/null
	$ openssl dgst -sha1 -sign user2.private.key message.txt > message.txt.user2.signature
	$ $lib_dir/verify tiva/ message.txt | wc -l
	< 1
	$ openssl pkey -in user2.private.key -pubout > "tiva/public keys/user2.public.key"
	$ $lib_dir/verify tiva/ message.txt | wc -l
	< 2
	$ $lib_dir/verify tiva/ message.txt | sort
	< user
	< user2

If the message is changed, the signatures lose their validity.

	$ echo "Another test message." > message.txt
	$ $lib_dir/verify tiva/ message.txt | wc -l
	< 0
