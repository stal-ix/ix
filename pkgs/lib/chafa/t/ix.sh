{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/1.14.0.tar.gz
sha:faefc09807c955c882fa044947fc939952862f6e8d2e242262dbcc9f97e108ef
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
