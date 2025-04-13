{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpsl
{% endblock %}

{% block version %}
0.21.5
{% endblock %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/{{self.version().strip()}}/libpsl-{{self.version().strip()}}.tar.gz
sha:1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*tools.*||' -i meson.build
{% endblock %}
