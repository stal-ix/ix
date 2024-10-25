{% extends '//bin/zenity/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/4.0.3.tar.gz
sha:5f50c315a937e1061f0ec5267a8dcc1f430c6aca6ca285373820fd03f420980c
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
