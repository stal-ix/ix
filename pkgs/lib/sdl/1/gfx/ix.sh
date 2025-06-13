{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
SDL_gfx
{% endblock %}

{% block version %}
2.0.27
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/sdlgfx/SDL_gfx-{{self.version().strip()}}.tar.gz
dfb15ac5f8ce7a4952dc12d2aed9747518c5e6b335c0e31636d23f93c630f419
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/1
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL \${CPPFLAGS}"
{% endblock %}
