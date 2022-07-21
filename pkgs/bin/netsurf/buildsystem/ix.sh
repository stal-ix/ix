{% extends '//die/c/make.sh' %}

{% block fetch %}
https://source.netsurf-browser.org/buildsystem.git/snapshot/buildsystem-release/1.9.tar.gz
sha:47346cdadde5197e5bc1bd70f2f1b4daf1295a8993d70618966a36bf3d8bc012
{% endblock %}

{% block unpack %}
{{super()}}
cd 1*
{% endblock %}

{% block make_flags %}
COMPONENT_TYPE=lib-static
{% endblock %}

{% block env %}
export NSBS="${out}/share/netsurf-buildsystem"
{% endblock %}
