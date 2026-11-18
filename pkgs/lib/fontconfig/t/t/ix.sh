{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
fontconfig
{% endblock %}

{% block version %}
2.18.4
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/fontconfig/fontconfig/-/archive/{{self.version().strip()}}/fontconfig-{{self.version().strip()}}.tar.bz2
f10495c6d8cad87089b9bfa583491a7ef63180a7be19339e1f02c60c4f35a152
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
