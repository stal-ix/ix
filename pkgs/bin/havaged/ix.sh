{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
haveged
{% endblock %}

{% block version %}
1.9.26
{% endblock %}

{% block fetch %}
https://github.com/jirka-h/haveged/archive/refs/tags/v{{self.version().strip()}}.tar.gz
74bc6052506451ca9f23ba186f72cf81b124f859351f8a4b777ead32d9bdd4da
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
