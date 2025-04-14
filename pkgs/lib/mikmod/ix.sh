{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libmikmod
{% endblock %}

{% block version %}
3.3.11.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mikmod/libmikmod/{{self.version().strip()}}/libmikmod-{{self.version().strip()}}.tar.gz
sha:ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19
{% endblock %}

{% block lib_deps %}
lib/c
{% if darwin %}
lib/darwin/framework/CoreAudio
{% endif %}
{% endblock %}
