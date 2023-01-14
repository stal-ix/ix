{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.leonerd.org.uk/code/libvterm/libvterm-0.3.tar.gz
sha:61eb0d6628c52bdf02900dfd4468aa86a1a7125228bab8a67328981887483358
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/perl
bld/libtool
bld/pkg/config
{% endblock %}
