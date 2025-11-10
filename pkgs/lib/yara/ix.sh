{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
yara
{% endblock %}

{% block version %}
4.5.5
{% endblock %}

{% block fetch %}
https://github.com/VirusTotal/yara/archive/refs/tags/v{{self.version().strip()}}.tar.gz
d38e30fd9c1e1c7921d1c4568262d94f5c2d6b5da139fe49572a43ffbc5c53f6
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
