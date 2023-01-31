{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mil/lisgd/archive/0.3.7.tar.gz
sha:e4c5751984ef1f8d21f6f6548c184bca21a626b345fa0489e94f276ca49e950e
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
