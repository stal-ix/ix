Build: ./ix build bin/openvpn/yandex
Executable: bin/openvpn-yandex (Linux x86_64)

The pinned Yandex OpenVPN 2.6.12-ya binary includes dns-srv and
yandex-client. A static solo stub loads it and six bundled libraries
directly from this one executable, without extracting an Ubuntu runtime.
This follows bin/claude/code's solo-pack layout.

Configuration, certificates and authentication remain external. The
package does not install a VPN service, DNS settings or routes, and does
not replace bin/openvpn. The upstream DEB's maintainer scripts are not run.
PAM/down-root plugins and optional OpenSSL engines/providers are not bundled.

The Ubuntu library versions and checksums are pinned in ix.sh. Updating
those libraries requires rebuilding the bundle. Copyright notices are
installed under share/licenses/openvpn-yandex.
