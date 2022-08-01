{% extends '//die/c/ix.sh' %}

{% block fetch %}
https://github.com/bfgroup/b2/archive/refs/tags/4.9.2.tar.gz
sha:7e1a135b308999d2a65fce3eba8f4ffb41ca82ae133f8494cc42cbca63c890de
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/bison
{% endblock %}
