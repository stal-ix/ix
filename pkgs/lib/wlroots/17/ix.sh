{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/7abda952d0000b72d240fe1d41457b9288f0b6e5/wlroots-7abda952d0000b72d240fe1d41457b9288f0b6e5.tar.bz2
sha:54cf8f5a12b825c097d16ae727ccbe878e278471778b73b2324502b53b1154e6
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
