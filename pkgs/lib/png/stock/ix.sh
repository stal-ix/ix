{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libpng
{% endblock %}

{% block version %}
1.6.48
{% endblock %}

{% block fetch %}
https://github.com/glennrp/libpng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:b17e99026055727e8cba99160c3a9a7f9af788e9f786daeadded5a42243f1dd0
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
