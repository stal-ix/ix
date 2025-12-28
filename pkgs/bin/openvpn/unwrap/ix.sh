{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
openvpn
{% endblock %}

{% block version %}
2.6.17
{% endblock %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v{{self.version().strip()}}.tar.gz
bfb421053d3f6610d4e1779a49b2e2de49f6ae928ae19b5516b705f256ca8b6d
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
