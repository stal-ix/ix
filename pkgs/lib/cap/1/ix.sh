{% extends '//lib/cap/t/ix.sh' %}

{% block pkg_name %}
libcap
{% endblock %}

{% block version %}
1.2.64
{% endblock %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/snapshot/libcap-cap/v{{self.version().strip()}}.tar.gz
sha:b2a9395b876844273e1c7f68c0bbc9ada2637fa585d2ae5c0e308b4840a3eaf4
{% endblock %}

{% block unpack %}
{{super()}}
cd v*/libcap
{% endblock %}
