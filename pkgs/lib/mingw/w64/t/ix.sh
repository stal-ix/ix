{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mingw-w64
{% endblock %}

{% block version %}
14.0.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v{{self.version().strip()}}.tar.bz2
6eaf921d9eb987d3820b364ea9775bc19b965ec81490b6fdd716526c28e1995c
{% endblock %}
