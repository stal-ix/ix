{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/Syllo/nvtop/archive/refs/tags/2.0.4.tar.gz
sha:14687353e0cc561c87200b9409aa62d9cb26a4c75fbdbdd0925cf4c1297a279f
{% endblock %}

{% block bld_libs %}
lib/c
lib/drm
lib/curses
{% endblock %}
