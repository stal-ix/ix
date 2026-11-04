{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
Little-CMS
{% endblock %}

{% block version %}
2.20
{% endblock %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms{{self.version().strip()}}.tar.gz
49908a4492fe7fc886517d636474bd953ebe698d38ecd3ee5862dfa308dd43ae
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
{% if wasi %}
{# no threads on wasi; with them lcms2 is compiled -pthread, that is
   +atomics, and under LTO that one feature turns the whole module's
   atomic operations into real atomics, which a runtime without shared
   memory refuses #}
--without-threads
{% endif %}
{% endblock %}
