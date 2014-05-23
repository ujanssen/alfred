postfix
=======

Postfix send root mails via gmail ("Satellite System").

Install
-------

	sudo apt-get install postfix libsasl2-modules bsd-mailx
	sudo dpkg-reconfigure postfix


Configure
---------

/etc/postfix/main.cf:

	smtpd_banner = $myhostname ESMTP $mail_name (Ubuntu)
	biff = no

	append_dot_mydomain = no

	readme_directory = no

	smtpd_tls_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
	smtpd_tls_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
	smtpd_use_tls=yes
	smtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
	smtp_tls_session_cache_database = btree:${data_directory}/smtp_scache

	smtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
	myhostname = nas
	alias_maps = hash:/etc/aliases
	alias_database = hash:/etc/aliases
	mydestination = nas, localhost.localdomain, localhost
	relayhost = [smtp.gmail.com]:587
	mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
	mailbox_size_limit = 0
	recipient_delimiter = +
	inet_interfaces = all

	sender_canonical_maps = hash:/etc/postfix/sender_canonical
	smtp_sasl_auth_enable = yes
	smtp_tls_security_level = may
	smtp_sasl_security_options = noanonymous
	smtp_sasl_password_maps = hash:/etc/postfix/sasl_password


/etc/postfix/sender_canonical:

	root user@gmail.com

/etc/postfix/sasl_password:

	[smtp.gmail.com]:587 user@gmail.com:passwd

/etc/aliases:

	postmaster:    root
	root:	user@gmail.com


Run
---

	sudo postmap hash:/etc/postfix/sender_canonical 
	sudo postmap hash:/etc/postfix/sasl_password 
  	sudo newaliases
	sudo /etc/init.d/postfix restart 


Test
----

Mail from root:

	mail root@localhost -s "test" < /var/log/mail.log
