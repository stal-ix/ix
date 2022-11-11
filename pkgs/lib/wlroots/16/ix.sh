{% extends '//lib/wlroots/15/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.16.0/wlroots-0.16.0.tar.bz2
sha:3be91163208577761969a8ae499d737c4dbb764f73c46aa8f76a512ee36b7da4
{% endblock %}

{% block bld_data %}
{{super()}}
aux/hwdata
{% endblock %}
