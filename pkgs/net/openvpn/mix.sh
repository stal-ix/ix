{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.4.tar.gz
33
{% endblock %}

{% set ssl %}{{mix.flags.get('openvpnssl', 'openssl')}}{% endset %}

{% block bld_deps %}
lib/lz4/mix.sh
lib/lzo/mix.sh
lib/{{ssl}}/mix.sh
pypi/docutils/scripts/mix.sh
dev/build/autoconf/2.69/mix.sh
dev/build/automake/1.16.3/mix.sh
{{super()}}
{% endblock %}

{% block autoreconf %}
libtoolize -c
autoreconf -i
{% endblock %}

{% block coflags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/sbin ${out}/bin
{% endblock %}
