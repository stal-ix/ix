{% extends '//die/c/autohell.sh' %}

{% block fetch %}
{% if std_box or std_env %}
https://www.nasm.us/pub/nasm/releasebuilds/2.16.01/nasm-2.16.01.tar.gz
sha:d833bf0f5716e89dbcd345b7f545f25fe348c6e2ef16dbc293e1027bcd22d881
{% else %}
https://www.nasm.us/pub/nasm/releasebuilds/2.16.02/nasm-2.16.02.tar.gz
sha:3ab7ca964f741fc05efc50689382f6730fce96bc73e4e74e5fcce66cc973abce
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
