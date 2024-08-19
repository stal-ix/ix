{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/Dr-Noob/cpufetch/archive/refs/tags/v1.06.tar.gz
sha:b8ec1339cf3a3bb9325cde7fb0748dd609043e8d2938c292956da7e457bdb7d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
