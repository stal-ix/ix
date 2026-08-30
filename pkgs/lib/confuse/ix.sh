{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libconfuse
{% endblock %}

{% block version %}
3.4
{% endblock %}

{% block fetch %}
https://github.com/libconfuse/libconfuse/archive/refs/tags/v{{self.version().strip()}}.tar.gz
be97bf64ab8052ef874e6c2cfabd2dacf7ad76575bb12c7c42df3fd23675d151
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/flex
bld/gettext
{% endblock %}
