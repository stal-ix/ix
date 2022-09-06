{% extends '//die/c/make.sh' %}

{% block fetch %}
https://git.sr.ht/~mil/lisgd/archive/0.3.5.tar.gz
sha:e795f7d00142eee6b8d8f5f2cd19a5282b8c911b1c829d88353ccbb5bc877e46
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
