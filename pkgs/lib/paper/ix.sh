{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpaper
{% endblock %}

{% block version %}
2.2.8
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v{{self.version().strip()}}/libpaper-{{self.version().strip()}}.tar.gz
1e330571690191874eca415ec76889dd11bab9887a2302d6a3665cd081c4d77b
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
