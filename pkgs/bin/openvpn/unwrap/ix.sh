{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.6.4.tar.gz
sha:bfab07b900262a990fc4519596b29c380ed5a89216593f04719279715ebd04d3
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

{% block bld_tool %}
pip/docutils/scripts
{% endblock %}

{% block configure_flags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}
