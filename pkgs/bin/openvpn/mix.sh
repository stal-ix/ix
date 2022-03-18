{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.6.tar.gz
sha:1061275433a48af24657228204718ac933519956ba09b30879267d3138678787
{% endblock %}

{% block bld_libs %}
lib/c
lib/lz4
lib/lzo
{% if linux %}
lib/linux
{% endif %}
lib/{{openvpnssl or 'openssl'}}
{% endblock %}

{% block bld_tool %}
pip/docutils/scripts
{% endblock %}

{% block configure_flags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}
