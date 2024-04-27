{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.3/wlroots-0.17.3.tar.bz2
sha:b916d9574367373d42334ea12ea3cead27ebc3b8de3bea375619e537d86b0757
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
