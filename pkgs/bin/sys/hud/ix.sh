{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/System64fumo/syshud/archive/734d632ca0665a288d1308f883d974462fa2d349.zip
sha:f129916b4e28145821496c19c00bcd4478ccb5e431e87944dc5d37f1a25481cb
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/evdev
lib/gtk/4/mm
lib/gtk/layer/shell/4
{% endblock %}

{% block patch %}
sed -e 's|.*define AUDIO.*||' -i src/config.hpp
sed -e 's|-fno-exceptions||' -i Makefile
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cpp_missing %}
unistd.h
{% endblock %}
