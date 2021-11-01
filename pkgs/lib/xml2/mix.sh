{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
# md5 f433a39be087a9f0b197eb2307ad9f75
{% endblock %}

{% block lib_deps %}
lib/iconv/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
dev/build/pkg-config/mix.sh
env/std/mix.sh
{% endblock %}

{% block coflags %}
--with-ftp=off
--with-http=off
--with-modules=off
--disable-python
--without-python
{% endblock %}

{% block env %}
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
{% endblock %}
