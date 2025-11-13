{% extends '//bin/zenity/t/ix.sh' %}

{% block pkg_name %}
zenity
{% endblock %}

{% block version %}
4.2.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/{{self.version().strip()}}.tar.gz
fb175704e081efc5c8d5aab2ac669cacdec0833eeffa7f2df64d283836c7565e
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
