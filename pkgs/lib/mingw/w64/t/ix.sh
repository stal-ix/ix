{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mingw-w64
{% endblock %}

{% block version %}
12.0.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v{{self.version().strip()}}.tar.bz2
sha:cc41898aac4b6e8dd5cffd7331b9d9515b912df4420a3a612b5ea2955bbeed2f
{% endblock %}
