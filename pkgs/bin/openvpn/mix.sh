{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/OpenVPN/openvpn/archive/refs/tags/v2.5.5.tar.gz
sha:f36d179102426082ed092a245b747f075e7da58d00867e95b0ea955b48ee60af
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
