{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpaper
{% endblock %}

{% block version %}
2.2.5
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v{{self.version().strip()}}/libpaper-{{self.version().strip()}}.tar.gz
sha:7be50974ce0df0c74e7587f10b04272cd53fd675cb6a1273ae1cc5c9cc9cab09
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
