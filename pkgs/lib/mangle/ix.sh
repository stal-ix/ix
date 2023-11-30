{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/mingw-w64/mingw-w64/mingw-w64-release/mingw-w64-v11.0.1.tar.bz2
sha:3f66bce069ee8bed7439a1a13da7cb91a5e67ea6170f21317ac7f5794625ee10
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd mingw-w64-libraries/libmangle
{% endblock %}
