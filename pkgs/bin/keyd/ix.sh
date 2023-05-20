{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rvaiya/keyd/archive/refs/tags/v2.4.3.tar.gz
sha:d4075f673879f4950c1c0d43985797603200e993596a5d7fcec1597c2350c380
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/input
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
