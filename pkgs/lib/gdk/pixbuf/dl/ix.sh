{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/gdk/pixbuf
{% endblock %}

{% block export_libs %}
libgdk_pixbuf-2.0.a
{% endblock %}

{% block export_lib %}
gdk_pixbuf-2
{% endblock %}
