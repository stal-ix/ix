{% extends '//lib/wlroots/15/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.16.1/wlroots-0.16.1.tar.bz2
sha:1ea948d044d7c475f91c89719986482fe427eb48223cfe2ddf9426ff60b94674
{% endblock %}

{% block bld_data %}
{{super()}}
aux/hwdata
{% endblock %}

{% block meson_flags %}
{{super()}}
examples=false
{% endblock %}
