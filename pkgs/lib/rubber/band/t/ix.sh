{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://breakfastquay.com/files/releases/rubberband-3.1.1.tar.bz2
sha:a442551fe7d26fb4a54dd1c34178733dc9c76ac9ce051a02325f5cb35d154381
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
fft=builtin
{% endblock %}
