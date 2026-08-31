{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
wget
{% endblock %}

{% block version %}
2.2.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-{{self.version().strip()}}.tar.gz
d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/zstd
lib/intl
lib/pcre
lib/idn/2
lib/iconv
lib/bzip/2
lib/brotli
lib/gnutls
lib/ng/http/2
lib/shim/extra
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/texinfo
{% endblock %}

{% block configure_flags %}
--without-plugin-support
--with-ssl=gnutls
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/bin/wget2_noinstall
{% endblock %}

{% block c_rename_symbol %}
log_init
{% endblock %}
