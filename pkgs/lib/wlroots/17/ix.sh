{% extends '//lib/wlroots/16/ix.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.2/wlroots-0.17.2.tar.bz2
sha:1d925ceff68a23ba73aa56a01e52d3260c4544d48e0c9d8cf4dc247c71612ed3
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/display/info
{% endblock %}
