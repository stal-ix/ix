{% extends '//die/c/make.sh' %}

{% block fetch %}
http://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.4.tar.xz
sha:43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5ddb779da8837542212
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block make_flags %}
MACHINE={{target.arch}}
sbindir=${out}/bin
{% endblock %}
