{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
xz
{% endblock %}

{% block version %}
5.8.1
{% endblock %}

{% block fetch %}
https://github.com/tukaani-project/xz/releases/download/v{{self.version().strip()}}/xz-{{self.version().strip()}}.tar.gz
sha:507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block std_box %}
{% if mingw32 %}
bin/slibtool
{% endif %}
{{super()}}
{% endblock %}

{% block configure_flags %}
{% if wasi %}
--enable-threads=no
{% endif %}
{% endblock %}
