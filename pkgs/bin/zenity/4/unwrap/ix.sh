{% extends '//bin/zenity/t/ix.sh' %}

{% block pkg_name %}
zenity
{% endblock %}

{% block version %}
4.2.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/{{self.version().strip()}}.tar.gz
62156891e975539cd8441231e7999c0027326159bb316e2ef95047498d523e81
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
