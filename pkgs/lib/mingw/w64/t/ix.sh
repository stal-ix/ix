{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
mingw-w64
{% endblock %}

{% block version %}
13.0.0
{% endblock %}

{% block fetch %}
https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v{{self.version().strip()}}.tar.bz2
5afe822af5c4edbf67daaf45eec61d538f49eef6b19524de64897c6b95828caf
{% endblock %}
