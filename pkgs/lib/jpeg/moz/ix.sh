{% extends '//lib/jpeg/turbo/ix.sh' %}

{% block fetch %}
https://github.com/mozilla/mozjpeg/archive/refs/tags/v4.1.1.tar.gz
sha:66b1b8d6b55d263f35f27f55acaaa3234df2a401232de99b6d099e2bb0a9d196
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
{{super()}}
PNG_SUPPORTED=OFF
{% endblock %}
