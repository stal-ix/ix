{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/icu
lib/dlfcn
{% endblock %}

{% block export_libs %}
libicui18n.a
{% endblock %}

{% block export_lib %}
icui18n
{% endblock %}
