{# gdk-pixbuf's SVG loader on lib/svg: io.cpp #}

{% extends '//die/inline/library.sh' %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
lib/svg
lib/gdk/pixbuf/unwrap
{% endblock %}

{% block cpp_defines %}
GDK_PIXBUF_ENABLE_BACKEND=1
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++17 ${CXXFLAGS}"
{% endblock %}

{% block sources %}
io.cpp
{% endblock %}
