{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/ferzkopp/SDL_gfx/archive/0df23ee8fc74b3bde3b81004b4fa10caf6a7c76c.zip
sha:7af15f7b77c17e45f26066beef79f0f1fc5e92e2926a18428a2dc643e3331f75
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/1
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL \${CPPFLAGS}"
{% endblock %}
