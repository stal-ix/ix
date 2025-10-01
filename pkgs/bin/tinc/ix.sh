{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://tinc-vpn.org/packages/tinc-1.0.36.tar.gz
40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/lzo
lib/openssl/1
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}
