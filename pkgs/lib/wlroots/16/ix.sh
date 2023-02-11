{% extends '//lib/wlroots/15/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.16.2/wlroots-0.16.2.tar.bz2
sha:afea2cc740344c4e86749cf4908e07692e183cb14a3db854d24dec454c664b88
{% endblock %}

{% block bld_data %}
{{super()}}
aux/hwdata
{% endblock %}

{% block meson_flags %}
{{super()}}
examples=false
{% endblock %}
