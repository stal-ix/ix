{% extends '//die/c/make.sh' %}

{# depends on proper systemd #}

{% block fetch %}
https://github.com/rfjakob/systembus-notify/archive/refs/tags/v1.1.tar.gz
sha:267f507811940f5e4129847e38ce54f6e40f66af5cbb6f46e84009d5f9a5afd6
{% endblock %}

{% block bld_libs %}
lib/c
lib/basu
{% endblock %}
