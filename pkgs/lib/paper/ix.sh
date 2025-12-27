{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpaper
{% endblock %}

{% block version %}
2.2.7
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v{{self.version().strip()}}/libpaper-{{self.version().strip()}}.tar.gz
3925401edf1eda596277bc2485e050b704fd7f364f257c874b0c40ac5aa627c0
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
