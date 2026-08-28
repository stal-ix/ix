{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpsl
{% endblock %}

{% block version %}
0.23.3
{% endblock %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/{{self.version().strip()}}/libpsl-{{self.version().strip()}}.tar.gz
93941f85a1e7bd593fa94f299233cb5dfc91cd144fd9a78a6ceb75001c5b03be
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*tools.*||' -i meson.build
{% endblock %}
