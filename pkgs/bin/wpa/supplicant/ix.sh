{% extends '//die/make.sh' %}

{% block fetch %}
https://w1.fi/releases/wpa_supplicant-2.10.tar.gz
sha:20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/xml2
lib/dbus
lib/linux
lib/openssl
lib/readline
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block unpack %}
{{super()}}
cd wpa_supplicant
{% endblock %}

{% block configure %}
cat > .config << "EOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PEERKEY=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_SMARTCARD=y
CONFIG_WPS=y
CONFIG_CTRL_IFACE_DBUS=y
CONFIG_CTRL_IFACE_DBUS_NEW=y
CONFIG_CTRL_IFACE_DBUS_INTRO=y
EOF
{% endblock %}

{% block make_flags %}
BINDIR=${out}/bin
LIBDIR=${out}/bin/bin_wpa_supplicant
{% endblock %}
