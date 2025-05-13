{% extends '//die/c/meson.sh' %}

{% block version %}
1.5.1
{% endblock %}

{% block pkg_name %}
kanshi
{% endblock %}

{% block fetch %}
https://git.sr.ht/~emersion/kanshi/archive/v{{self.version().strip()}}.tar.gz
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
