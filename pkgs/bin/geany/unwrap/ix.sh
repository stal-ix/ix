{% extends '//die/c/gnome.sh' %}

{% block version %}
2.0.0
{% endblock %}

{% block fetch %}
https://github.com/geany/geany/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:a744ab9ae3e58b371de4b50990c44227c499f82e2a8ee6753307ef107748e4df
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/gdk/pixbuf/svg
{% endblock %}

{% block cpp_defines %}
_GNU_SOURCE=1
{% endblock %}
