{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yara
{% endblock %}

{% block version %}
4.5.8
{% endblock %}

{% block fetch %}
https://github.com/VirusTotal/yara/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c322414975ff6f701149856613afdcd92a7e6939c284c798ae3c85618197efaa
{% endblock %}

{% block lib_deps %}
lib/c
lib/magic
lib/jansson
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--enable-cuckoo=yes
--enable-magic=yes
--enable-macho=yes
--enable-dex=yes
{% endblock %}
