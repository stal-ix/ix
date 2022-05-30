{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/noocsharp/wayclip/archive/refs/tags/0.2.tar.gz
sha:170a9bb896d3a1a18643d062f70d92b6a2c2726ddf0c804990bec2557b521ba1
{% endblock %}

{% block bld_libs %}
lib/c
lib/wayland
{% endblock %}

{% block bld_tool %}
bin/wayland/protocols
{% endblock %}
