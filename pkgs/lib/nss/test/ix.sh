{% extends '//die/inline/program.sh' %}

{% block bld_libs %}
lib/c
lib/nss
{% endblock %}

{% block name %}
nss_init
{% endblock %}

{% block sources %}
main.cpp
{% endblock %}

{% block cpp_includes %}
${NSS_HEADERS}
{% endblock %}
