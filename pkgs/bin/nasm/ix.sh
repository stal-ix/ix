{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.gz
sha:d833bf0f5716e89dbcd345b7f545f25fe348c6e2ef16dbc293e1027bcd22d881
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
