### DNS resolvers can be added in OS X via the networksetup command:

``
sudo networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4
``

Insert name of network connection as appropriate. <br>
These resolvers will appear in resolv.conf as it is automatically generated, 
but direct edits to resolv.conf will not result in those resolvers being used. 
I assume the resolvers are stored in a plist somewhere;

It looks like the XML plist file storing the DNS servers is 

``
~/Library/Preferences/SystemConfiguration/preferences.plist
``


### Flushing the DNS cache

``
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder
``

### It turns out the solution was to bounce mDNSResponder:

``
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist<br>
``

``
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
``

#### OS X 10.10.0 – 10.10.3, Yosemite

Apparently, mDNSResponder doesn't exist in Yosemite (OS X 10.10).<br>
You can restart descoveryd instead to fix these issues.

``
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist

``
``
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.discoveryd.plist
``


#### OS X 10.10.4+, Yosemite

In OSX 10.10.4 the mDNSResponder has been reintroduced. So use the first one will work again.


scutil --dns

scutil -r hostname
