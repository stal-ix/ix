{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v2.4.2.tar.gz
sha:77c4bf6fad2f9eef93d1ebbca2d2520f5296cec32b1a64d62cb5521ecf3eb6e1
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
lib/input
{% endblock %}

{% block bld_tool %}
bld/scripts/fakegit
{% endblock %}
