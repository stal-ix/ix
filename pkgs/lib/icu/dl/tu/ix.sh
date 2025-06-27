{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/icu
lib/dlfcn
{% endblock %}

{% block export_libs %}
libicutu.a
{% endblock %}

{% block export_lib %}
icutu
{% endblock %}
