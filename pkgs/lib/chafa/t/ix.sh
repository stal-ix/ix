{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
chafa
{% endblock %}

{% block version %}
1.18.1
{% endblock %}

{% block fetch %}
https://github.com/hpjansson/chafa/archive/refs/tags/{{self.version().strip()}}.tar.gz
2f7c82fc144d2ddfed9ee863bbbb201953c2e4e0cc97e541fde25171cab7b826
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/ns/gif
{% endblock %}
