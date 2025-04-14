{% extends '//bin/glib/codegen/ix.sh' %}

{% block pkg_name %}
glib
{% endblock %}

{% block version %}
2.74.5
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/glib/2.74/glib-{{self.version().strip()}}.tar.xz
sha:ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8
{% endblock %}
