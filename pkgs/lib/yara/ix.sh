{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yara
{% endblock %}

{% block version %}
4.5.4
{% endblock %}

{% block fetch %}
https://github.com/VirusTotal/yara/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:586c9c21878f8b4d1b9423b89ac937f21f8057b03e3e9706f310549d453966fa
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
