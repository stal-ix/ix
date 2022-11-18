{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
http://www.oberhumer.com/opensource/ucl/download/ucl-1.03.tar.gz
sha:b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348
{% endblock %}

{% block autoreconf %}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cpp_missing %}
stddef.h
{% endblock %}
