{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.4.tar.gz
0a20d4bb3304b8f221c0893f4116449d
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
