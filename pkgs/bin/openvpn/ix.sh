{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.7.tar.gz
sha:a7db041f485cf165ff566da748ea7ec158fb4c53bbd9f706071434d6e7098a40
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
