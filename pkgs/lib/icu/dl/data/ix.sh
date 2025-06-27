{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/icu
lib/dlfcn
{% endblock %}

{% block export_libs %}
libicudata.a
{% endblock %}

{% block export_lib %}
icudata
{% endblock %}
