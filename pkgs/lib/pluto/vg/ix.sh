{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
plutovg
{% endblock %}

{% block version %}
1.0.0
{% endblock %}

{% block fetch %}
https://github.com/sammycage/plutovg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:d4a8015aee9eefc29b01e6dabfd3d4b371ae12f9d5e9be09798deb77a528a794
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/plutovg \${CPPFLAGS}"
{% endblock %}
