{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mil/lisgd/archive/0.3.6.tar.gz
sha:e19d366a46beda586c8d30dd17c7d44625b929b732493a3e7799aa31173239a0
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
