{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://cache.ruby-lang.org/pub/ruby/3.1/ruby-3.1.3.tar.gz
sha:5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/ffi
lib/gmp
lib/openssl
lib/readline
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block touch_yl %}
{% endblock %}

{% block configure_flags %}
--disable-dln
--without-git
--without-gcc
--with-static-linked-ext=yes
--with-rubylibprefix="${out}/share"
{% endblock %}
