Build: ./ix build bin/openvpn/yandex
Executable: bin/openvpn-yandex (Linux x86_64)

The pinned Yandex OpenVPN 2.6.12-ya binary includes dns-srv and
yandex-client. A static solo stub loads it directly from this one
executable, without extracting an Ubuntu runtime. This follows
bin/claude/code's solo-pack layout.

The binary's DT_NEEDED libraries are not shipped as Ubuntu DSOs. libc and
libresolv are served by solo's glibc ABI bridge over musl; libssl,
libcrypto, liblzo2, liblz4, libcap-ng and libpkcs11-helper are served by
static providers linked into the stub (lib/openssl/dl, lib/lzo/dl,
lib/lz4/dl, lib/cap/ng/dl, lib/pkcs11/helper/dl), built from ix's own
sources. Updating those libraries is an ordinary ix rebuild.

Configuration, certificates and authentication remain external. The
package does not install a VPN service, DNS settings or routes, and does
not replace bin/openvpn. The upstream DEB's maintainer scripts are not run.
PAM/down-root plugins and optional OpenSSL engines/providers are not bundled.

The upstream copyright notice is installed under
share/licenses/openvpn-yandex.
