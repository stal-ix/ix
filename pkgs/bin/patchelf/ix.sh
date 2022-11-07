{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NixOS/patchelf/archive/refs/tags/0.17.0.tar.gz
sha:cfdd0591bfe17f50775695fbddf94d49ef03d5a603888667747ad105f2e9853a
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}
