{% extends '//die/c/make.sh' %}

{% block pkg_name %}
cpufetch
{% endblock %}

{% block version %}
1.06
{% endblock %}

{% block fetch %}
https://github.com/Dr-Noob/cpufetch/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b8ec1339cf3a3bb9325cde7fb0748dd609043e8d2938c292956da7e457bdb7d9
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
