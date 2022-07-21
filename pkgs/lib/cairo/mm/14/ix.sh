{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-1.14.0.tar.xz
sha:b64400a78304b2fba13036130d78ebf7588675546714fd5329d97ec80ed01217
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/2
{% endblock %}
