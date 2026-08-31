{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xz
{% endblock %}

{% block version %}
5.8.3
{% endblock %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v{{self.version().strip()}}/xz-{{self.version().strip()}}.tar.gz
3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
{% if mingw32 %}
bin/slibtool
{% endif %}
{{super()}}
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}
