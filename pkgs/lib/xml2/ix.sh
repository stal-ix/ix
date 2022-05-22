{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.9.14/libxml2-v2.9.14.tar.bz2
sha:9bd7dae7690b2112033ddb6ad4f454e036fff2d38505c3a5b80427669484c0a4
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
