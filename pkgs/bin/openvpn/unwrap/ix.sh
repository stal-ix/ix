{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.6.7.tar.gz
sha:60dddec2e1f422789ad1cd431f03a509e8d06b4066c5002606caacd5f1fcd43e
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
