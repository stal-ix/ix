{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fontconfig
{% endblock %}

{% block version %}
2.18.3
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/{{self.version().strip()}}/fontconfig-{{self.version().strip()}}.tar.bz2
8d28f79d2017cbe1fbb7da84b2502c86421b4f45860234d2f4ab5b35564c8d01
{% endblock %}

{% block bld_tool %}
bin/gperf
bld/python
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/json/c
{% endblock %}

{% block meson_tool %}
bld/meson/6
{% endblock %}

{% block meson_flags %}
cache-build=disabled
fontations=disabled
{% endblock %}

{% block step_patch %}
{{super()}}
sed -e "s|meson_version : '>= 1.11.0'|meson_version : '>= 1.6.1'|" -i meson.build
{% endblock %}
