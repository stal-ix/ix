{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.2.3.tar.gz
sha:13824ea1f48fca15b933862f5071c718c1764bddd2ef0abce5d47308c08b2500
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
