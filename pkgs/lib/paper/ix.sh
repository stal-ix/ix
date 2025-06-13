{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpaper
{% endblock %}

{% block version %}
2.2.6
{% endblock %}

{% block fetch %}
https://github.com/rrthomas/libpaper/releases/download/v{{self.version().strip()}}/libpaper-{{self.version().strip()}}.tar.gz
500d39dc58768ee09688738c8b5bfe07640ba2fd6c25a6dc78810eb69c719e93
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
