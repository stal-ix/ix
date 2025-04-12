{% extends '//die/c/meson.sh' %}

{% block version %}
3.1.1
{% endblock %}

{% block fetch %}
https://breakfastquay.com/files/releases/rubberband-{{self.version().strip()}}.tar.bz2
sha:a442551fe7d26fb4a54dd1c34178733dc9c76ac9ce051a02325f5cb35d154381
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block meson_flags %}
fft=builtin
{% endblock %}
