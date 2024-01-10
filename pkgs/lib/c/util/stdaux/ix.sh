{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/c-util/c-stdaux/archive/refs/tags/v1.5.0.tar.gz
sha:19fb163160c25babf1f2ecf817e6eb696decfb5e33490dcd9cf68c2ecae97d13
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
