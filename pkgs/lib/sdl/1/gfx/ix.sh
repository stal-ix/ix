{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/sdlgfx/SDL_gfx-2.0.25.tar.gz
sha:556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389ba2fa7bdc4dec89059c0
{% endblock %}

{% block lib_deps %}
lib/c
lib/sdl/1
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/SDL \${CPPFLAGS}"
{% endblock %}
