{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
openvpn
{% endblock %}

{% block version %}
2.7.9
{% endblock %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
727d574df8d2628d7363751e326f32ae5b798353f17040c1642f2a5c7f131ae2
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
