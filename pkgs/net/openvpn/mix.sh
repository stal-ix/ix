{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.4.tar.gz
33
{% endblock %}

{% block bld_libs %}
lib/lz4/mix.sh
lib/lzo/mix.sh
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

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
