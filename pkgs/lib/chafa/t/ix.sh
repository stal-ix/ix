{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.14.3.tar.gz
sha:bbb5309b3bef5b2107eb7f391ac87dd84c9917dff0331b46538144fb63d1ec87
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
