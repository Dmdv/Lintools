### Openssl

## Links

https://www.digicert.com/easy-csr/openssl.htm

```
openssl req -new -newkey rsa:2048 -nodes -out dmdv.csr -keyout dmdv.key -subj "/C=RU/ST=/L=Moscow/O=Dmdv Inc/CN=dmdv"
```

## How to Install and Configure Your SSL Certificate on Your Apache Server
https://www.digicert.com/csr-ssl-installation/apache-openssl.htm


Copy the certificate files to your server.

Copy these files, along with the .key file you generated when creating the CSR, to the directory on the server where you keep your certificate and key files.

Note: Make them readable by root only to increase security.

Find the Apache configuration file (httpd.conf) you need to edit.

The location and name of the configuration file can vary from server to server—especially if you're using a special interface to manage your server configuration.

Apache's main configuration file is typically named httpd.conf or apache2.conf. Possible locations for this file include /etc/httpd/ or /etc/apache2/. For a comprehensive listing of default installation layouts for Apache HTTPD on various operating systems and distributions, see Httpd Wiki - DistrosDefaultLayout.

Often, the SSL certificate configuration is located in a <VirtualHost> block in a different configuration file. The configuration files may be under a directory like /etc/httpd/vhosts.d/, /etc/httpd/sites/, or in a file called httpd-ssl.conf.

One way to locate the SSL Configuration on Linux distributions is to search using grep, as shown in the example below.

Run the following command:

```
grep -i -r "SSLCertificateFile" /etc/httpd/
```
Note: Make sure to replace /etc/httpd/ with the base directory for your Apache installation.

Identify the SSL <VirtualHost> block you need to configure.

If your site needs to be accessible through both secure (https) and non-secure (http) connections, you need a virtual host for each type of connection. Make a copy of the existing non-secure virtual host and configure it for SSL as described in step 4.

If your site only needs to be accessed securely, configure the existing virtual host for SSL as described in step 4.

Configure the <VirtualHost> block for the SSL-enabled site

Below is a very simple example of a virtual host configured for SSL. The parts listed in blue are the parts you must add for SSL configuration.

```
<VirtualHost 192.168.0.1:443>
DocumentRoot /var/www/html2
ServerName www.yourdomain.com
SSLEngine on
SSLCertificateFile /path/to/your_domain_name.crt
SSLCertificateKeyFile /path/to/your_private.key
SSLCertificateChainFile /path/to/DigiCertCA.crt
</VirtualHost>
```
Make sure to adjust the file names to match your certificate files.

SSLCertificateFile is your DigiCert certificate file (e.g., your_domain_name.crt).

SSLCertificateKeyFile is the .key file generated when you created the CSR (e.g., your_private.key).

SSLCertificateChainFile is the DigiCert intermediate certificate file (e.g., DigiCertCA.crt)

Note: If the SSLCertificateChainFile directive does not work, try using the SSLCACertificateFile directive instead.

Test your Apache configuration file before restarting.

As a best practice, check your Apache configuration file for any errors before restarting Apache.

Caution: Apache won't start again if your configuration files have syntax errors.

Run the following command to test your configuration file (on some systems, it's apache2ctl):

apachectl configtest
Note: For EV certificates, Internet Explorer 7 requires you to turn ON the phishing filter. If you don't, the browser's address bar won't display properly--green address bar--letting customers know your site is being secured by an EV Certificate.

Restart Apache.

You can use apachectl commands to stop and start Apache with SSL support.

apachectl stop
apachect1 start
Restart Notes:

If Apache doesn't restart with SSL support, try using apachectl startssl instead of apachectl start. If SSL support only loads with apachectl startssl, we recommend you adjust the apache startup configuration to include SSL support in the regular apachectl start command. Otherwise, your server may require to manually restart Apache using apachectl startssl in the event of a server reboot. This usually involves removing the <IfDefine SSL> and </IfDefine> tags that enclose your SSL configuration.

Congratulations! You've successfully installed your SSL certificate.

Testing Your SSL/TLS Certificate Installation
Browser Test

For best results, make sure to close your web browser first and then re-launch it.

Visit your site with the secure https URL (i.e., go to https://www.example.com not http://www.example.com).

Be sure to test your site with more than just Internet Explorer. IE downloads missing intermediate certificates; whereas, other browsers give an error if all the certificates in the certificate chain aren't installed properly.
