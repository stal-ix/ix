{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.0/wlroots-0.17.0.tar.bz2
sha:0f0bb100b2277e6a0622bfe2594e4139b8462cb4c49ae883f042e8c4b1bdbc3e
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
