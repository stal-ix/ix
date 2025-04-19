{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yara
{% endblock %}

{% block version %}
4.5.2
{% endblock %}

{% block fetch %}
https://github.com/VirusTotal/yara/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:1f87056fcb10ee361936ee7b0548444f7974612ebb0e681734d8de7df055d1ec
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
