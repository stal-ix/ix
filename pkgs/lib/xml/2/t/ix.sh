{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.11.4/libxml2-v2.11.4.tar.bz2
sha:a9493ae091f58037dd5e73fc6035a4907eae58e2cc4756abc4e6253ee6036166
#https://gitlab.gnome.org/GNOME/libxml2/-/archive/v2.12.1/libxml2-v2.12.1.tar.bz2
#sha:8c7e368b1830028f6f4f0e3d128d317f8c49a32e66f4b87ce59a017bdf6514af
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
--with-legacy
--with-sax1
{% endblock %}
