{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/nullobsi/pass-secrets
{% endblock %}

{% block git_commit %}
9bf333ca0cd9c1d1788c5206c09570933d51da1d
{% endblock %}

{% block git_sha %}
aa64a3312573f7664f9507727d28e1d519f7d2038410a38ebf19e6c1623deb72
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sd/bus/c++
{% endblock %}

{% block bld_tool %}
bin/sd/bus/codegen
{% endblock %}
