{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
libmetalink
{% endblock %}

{% block version %}
0.1.3
{% endblock %}

{% block fetch %}
https://github.com/metalink-dev/libmetalink/releases/download/release-{{self.version().strip()}}/libmetalink-{{self.version().strip()}}.tar.bz2
0753ae1152d970dc3bf327d0ce5cfefeca2f1ab13294b115e64811163a68fd4f
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
{% endblock %}

{% block bld_libs %}
lib/xml/2
{% endblock %}

{% block configure_flags %}
--with-libexpat=yes
{% endblock %}
