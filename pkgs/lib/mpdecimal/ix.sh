{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://www.bytereef.org/software/mpdecimal/releases/mpdecimal-4.0.0.tar.gz
sha:942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c
{% endblock %}

{% block configure_flags %}
--enable-cxx=no
{% endblock %}

{% block env %}
export COFLAGS="--with-system-libmpdec=yes --with-libmpdec-prefix=${out} \${COFLAGS}"
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
