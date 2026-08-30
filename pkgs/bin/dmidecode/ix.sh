{% extends '//die/c/make.sh' %}

{% block version %}
3-6
{% endblock %}

{% block pkg_name %}
dmidecode
{% endblock %}

{% block fetch %}
https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-{{self.version().strip().replace('-', '.')}}.tar.xz
e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
MACHINE={{target.arch}}
sbindir=${out}/bin
{% endblock %}
