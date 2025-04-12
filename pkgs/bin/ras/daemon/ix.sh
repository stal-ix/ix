{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.8.0
{% endblock %}

{% block fetch %}
https://github.com/mchehab/rasdaemon/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e53474b0a3de73ced570c3f2f605bedf88960c03773178ec763963d21cdb1bf6
{% endblock %}

{% block bld_libs %}
lib/c
lib/trace/event
lib/argp/standalone
{% endblock %}
