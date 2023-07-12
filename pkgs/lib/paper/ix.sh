{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v2.1.1/libpaper-2.1.1.tar.gz
sha:a4e1297b69b9fd1054ee7f5bcc55f4d56da152d41d2eabdf18727a9cddc1f402
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
