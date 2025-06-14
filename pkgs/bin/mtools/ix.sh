{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mtools
{% endblock %}

{% block version %}
4.0.49
{% endblock %}

{% block fetch %}
http://ftp.gnu.org/gnu/mtools/mtools-{{self.version().strip()}}.tar.lz
76dfea98d923dfc9806ce34bd1786aa9b5a39d70f56f26c0670a348c664f1d2a
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}
