{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://storage.yandexcloud.net/mix-cache/openvpn-2.5.4.tar.xz
336be3b2388cdc65dd8c81f22b1c2836
{% endblock %}

{% set ssl %}{{mix.flags.get('openvpnssl', 'openssl')}}{% endset %}

{% block bld_deps %}
lib/lz4/mix.sh
lib/lzo/mix.sh
lib/{{ssl}}/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--disable-plugin-auth-pam
--disable-plugin-down-root
{% endblock %}

{% block postinstall %}
mv ${out}/sbin ${out}/bin
{% endblock %}
