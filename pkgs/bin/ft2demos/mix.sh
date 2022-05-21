{% extends '//die/meson.sh' %}

{# broken, need internal freetype headers #}

{% block fetch %}
https://gitlab.freedesktop.org/freetype/freetype-demos/-/archive/VER-2-12-0/freetype-demos-VER-2-12-0.tar.bz2
sha:47a64eba92f0fe39a0e9a940dbe2a49b9fb20a6c89d2cb0681d63897f37c6db0
{% endblock %}

{% block bld_libs %}
lib/c
lib/freetype
{% endblock %}
