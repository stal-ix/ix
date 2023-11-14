{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mil/lisgd/archive/0.4.0.tar.gz
sha:1eef0a3c4c297714b52dd061d40611c955ea8479ef3e60cfb0f7ab9cb22e65e7
{% endblock %}

{% block bld_libs %}
lib/c
lib/input
lib/wayland
lib/shim/x11
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}
