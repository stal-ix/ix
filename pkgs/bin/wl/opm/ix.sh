{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~leon_plickat/wlopm/archive/v0.1.0.tar.gz
sha:f9a7ec03a412e602420ab11d0eea872f6d30dfe5cfee93cd3d0289e4fbbb3aa1
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bld/wayland
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
