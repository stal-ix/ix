{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.tinc-vpn.org/git/browse?p=tinc;a=snapshot;h=c0331713431949a5fd6bf47501b9fadf6489c5c1;sf=tgz
sha:d7f620b84c2741f99d41ec1207b6ffddc911dd6a69d02d238182dab0c60dbee7
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
