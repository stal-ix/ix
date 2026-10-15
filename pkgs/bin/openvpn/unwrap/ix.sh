{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
openvpn
{% endblock %}

{% block version %}
2.7.8
{% endblock %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
daf18f81040137fc4d3d843088954ae68f6c86c10d3860114078b9c256a3516f
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
