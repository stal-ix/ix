{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.4/wlroots-0.17.4.tar.bz2
sha:76cea5143c966640000efad32d5961b1d2303744497d30ef5e78aaf50360288d
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
