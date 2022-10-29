{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.8.tar.gz
sha:c216a66c967181b38002c1fd06fb5cad4a8c21865af76cb22b3bf4786070d315
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
