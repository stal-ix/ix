{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/PhilipHazel/pcre2/archive/refs/tags/pcre2-10.40.tar.gz
sha:a057381270857d01a1a8b2c2fcf176b1c3c6aea595d586649755c33a5843d52f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
--enable-pcre2-16
--enable-pcre2-32
--enable-newline-is-anycrlf
--enable-utf8
--enable-jit
--disable-c++
{% endblock %}
