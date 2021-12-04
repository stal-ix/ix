{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.4.tar.gz
0a20d4bb3304b8f221c0893f4116449d
{% endblock %}

{% block bld_libs %}
lib/lz4/mix.sh
lib/lzo/mix.sh
{% if mix.platform.target.os == 'linux' %}
lib/linux/mix.sh
{% endif %}
lib/{{openvpnssl or 'openssl'}}/mix.sh
{% endblock %}

{% block bld_tool %}
pypi/docutils/scripts/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block coflags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}
