{% extends '//die/autohell.sh' %}

{% block fetch %}
https://github.com/qpdf/qpdf/archive/refs/tags/release-qpdf-10.6.3.tar.gz
sha:64bbb654ec19b6812284ef1bc40c57b091de5281f265f1c3c83dd8ccf6bedcf5
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/jpeg
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}
