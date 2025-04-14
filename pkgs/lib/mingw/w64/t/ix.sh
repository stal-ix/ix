{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mingw-w64
{% endblock %}

{% block version %}
11.0.1
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v{{self.version().strip()}}.tar.bz2
sha:3f66bce069ee8bed7439a1a13da7cb91a5e67ea6170f21317ac7f5794625ee10
{% endblock %}
