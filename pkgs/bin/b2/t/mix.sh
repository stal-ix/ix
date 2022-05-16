{% extends '//mix/c_std.sh' %}

{% block fetch %}
#https://github.com/boostorg/build/archive/refs/tags/4.4.1.tar.gz
#sha:31a243b1eb26638500977a8386e56d44f86c18db70cf0a5dcdd2d7391afc1a61

https://github.com/bfgroup/b2/archive/refs/tags/4.9.0.tar.gz
sha:7c614e41f10e004c7539c75c60f7b2df26a61fe35058e9021f8fd5049c97a255
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
