{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libtsm
{% endblock %}

{% block version %}
4.8.0
{% endblock %}

{% block fetch %}
https://github.com/kmscon/libtsm/archive/refs/tags/v{{self.version().strip()}}.tar.gz
50811e9e94fc798eb5dcbaff20f81067c942ec47f329f91bbe4caeb35a61ff05
{% endblock %}

{% block lib_deps %}
lib/c
lib/xkb/common
{% endblock %}

{% block cpp_defines %}
static_assert=_Static_assert
{% endblock %}
