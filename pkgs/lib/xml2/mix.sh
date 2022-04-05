{% extends '//mix/autohell.sh' %}

{% block fetch %}
http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
f433a39be087a9f0b197eb2307ad9f75
{% endblock %}

{% block lib_deps %}
lib/c
lib/iconv
{% endblock %}

{% block configure_flags %}
--with-ftp=off
--with-http=off
--with-modules=off
--disable-python
--without-python
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-libxml2-prefix=${out} \${COFLAGS}"
export CPPFLAGS="-I${out}/include/libxml2 \${CPPFLAGS}"
{% endblock %}
