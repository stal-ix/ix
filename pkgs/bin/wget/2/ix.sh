{% extends '//die/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/wget/wget2-2.0.1.tar.gz
sha:0bb7fa03697bb5b8d05e1b5e15b863440826eb845874c4ffb5e32330f9845db1
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/zstd
lib/intl
lib/pcre
lib/bzip2
lib/idn/2
lib/iconv
lib/brotli
lib/gnutls
lib/ng/http/2
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
