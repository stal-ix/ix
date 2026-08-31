{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
openvpn
{% endblock %}

{% block version %}
2.7.6
{% endblock %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
627125f0a1ee8cfaa6e0c611de58c799b94c067f49c79f531563bc641ab8e8a9
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/lz4
lib/lzo
lib/kernel
lib/cap/ng
lib/bsd/overlay
lib/{{openvpnssl or 'openssl'}}
{% endblock %}

{% block configure_flags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}

{% block build %}
{{super()}}
>doc/openvpn.8
>doc/openvpn-examples.5
{% endblock %}
