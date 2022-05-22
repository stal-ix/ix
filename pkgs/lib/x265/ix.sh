{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/videolan/x265/archive/refs/tags/3.4.tar.gz
d867c3a7e19852974cf402c6f6aeaaf3
{% endblock %}

{% block unpack %}
{{super()}}
cd source
{% endblock %}

{% block cmake_flags %}
ENABLE_SHARED=OFF
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
