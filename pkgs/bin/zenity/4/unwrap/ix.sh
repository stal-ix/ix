{% extends '//bin/zenity/t/ix.sh' %}

{% block pkg_name %}
zenity
{% endblock %}

{% block version %}
4.0.5
{% endblock %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/{{self.version().strip()}}.tar.gz
63e8db0261bb9d38402ff6899c49e225d5f24bf3b104a2848ada542c3eca2668
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
