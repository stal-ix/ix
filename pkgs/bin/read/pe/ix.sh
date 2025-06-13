{% extends '//die/c/make.sh' %}

{% block pkg_name %}
readpe
{% endblock %}

{% block version %}
0.84
{% endblock %}

{% block fetch %}
https://github.com/mentebinaria/readpe/archive/refs/tags/v{{self.version().strip()}}.tar.gz
2d0dc383735802db62234297ae1703ccbf4b6d2f2754e284eb90d6f0a57aa670
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}
