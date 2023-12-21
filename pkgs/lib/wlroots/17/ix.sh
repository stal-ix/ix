{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.1/wlroots-0.17.1.tar.bz2
sha:80fa4163ed585bce6fa0e9a35401f51da64231a3a5511118f1e4c1ac97d458f7
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
