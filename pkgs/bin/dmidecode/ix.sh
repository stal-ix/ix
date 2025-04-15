{% extends '//die/c/make.sh' %}

{% block version %}
3-6
{% endblock %}

{% block pkg_name %}
dmidecode
{% endblock %}

{% block fetch %}
http://git.savannah.nongnu.org/cgit/dmidecode.git/snapshot/dmidecode-{{self.version().strip()}}.tar.gz
sha:fe25e4fe567dedf213c5fed0978cb684613ad599d9a50d710476147f58cdb2c1
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
MACHINE={{target.arch}}
sbindir=${out}/bin
{% endblock %}
