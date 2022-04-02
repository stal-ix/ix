{% extends '//bin/cmake/t/mix.sh' %}

{% block bld_libs %}
{% if darwin %}
lib/darwin/framework/CoreFoundation
{% endif %}

{% if linux %}
lib/linux
{% endif %}

lib/z
lib/c
lib/uv
lib/xz
lib/c++
lib/bzip2
lib/expat
lib/curl/lite
lib/archive/lite
{% endblock %}
