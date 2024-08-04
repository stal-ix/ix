{% extends '//die/dl/lib.sh' %}

{% block lib_deps %}
lib/portal
{% endblock %}

{% block export_libs %}
libportal-gtk{{gtk_ver}}.a
{% endblock %}

{% block export_lib %}
portal-gtk{{gtk_ver}}
{% endblock %}
