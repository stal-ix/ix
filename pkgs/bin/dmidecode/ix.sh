{% extends '//die/c/make.sh' %}

{% block fetch %}
http://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.5.tar.xz
sha:79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
MACHINE={{target.arch}}
sbindir=${out}/bin
{% endblock %}
