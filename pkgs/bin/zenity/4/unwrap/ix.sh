{% extends '//bin/zenity/t/ix.sh' %}

{% block fetch %}
https://github.com/GNOME/zenity/archive/refs/tags/4.1.90.tar.gz
sha:7c45847057b8be9c385a31055231f7efa3eff3bd4bd9ebd433675a78dca773d3
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/adwaita
{% endblock %}

{% block bld_tool %}
bld/help2man
{{super()}}
{% endblock %}
