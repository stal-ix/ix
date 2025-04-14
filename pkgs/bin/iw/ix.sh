{% extends '//die/c/make.sh' %}

{% block pkg_name %}
iw
{% endblock %}

{% block version %}
6.9
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/software/network/iw/iw-{{self.version().strip()}}.tar.xz
sha:3f2db22ad41c675242b98ae3942dbf3112548c60a42ff739210f2de4e98e4894
{% endblock %}

{% block bld_libs %}
lib/c
lib/nl
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/gzip
bld/pkg/config
{% endblock %}

{% block make_flags %}
SBINDIR="${out}/bin"
{% endblock %}
