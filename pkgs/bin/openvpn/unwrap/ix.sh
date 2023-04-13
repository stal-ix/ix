{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.6.3.tar.gz
sha:f24f4e739c2f5703014c79203862ea05c3aa0211b7efce49b1e59fa10bc61a7c
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
