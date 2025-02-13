{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/xiph/flac/archive/refs/tags/1.5.0.tar.gz
sha:aea54ed186ad07a34750399cb27fc216a2b62d0ffcd6dc2e3064a3518c3146f8
{% endblock %}

{% block bld_tool %}
bld/gettext
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/xiph/ogg
{% endblock %}
