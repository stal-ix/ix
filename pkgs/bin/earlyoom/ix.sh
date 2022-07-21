{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rfjakob/earlyoom/archive/refs/tags/v1.7.tar.gz
sha:ebda1279a813d9b0f7860ce5029ccf5ea9f8868be070f2eaf40f90f2e64b6414
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
