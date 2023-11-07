{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/glib
{% endblock %}

{% block export_libs %}
libgmodule-2.0.a
{% endblock %}

{% block export_lib %}
gmodule-2
{% endblock %}
