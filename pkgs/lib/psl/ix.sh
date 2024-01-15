{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz
sha:1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208
{% endblock %}

{% block lib_deps %}
lib/c
lib/idn/2
{% endblock %}

{% block patch %}
sed -e 's|.*subdir.*tools.*||' -i meson.build
{% endblock %}
