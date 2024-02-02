{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/archive/v1.5.1.tar.gz
sha:d403d2a99170261baa6606336724bc9721f779dc39294d2e088745d7bd41f427
{% endblock %}

{% block bld_libs %}
lib/c
lib/varlink
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
{% endblock %}
