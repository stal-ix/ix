{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
ruby
{% endblock %}

{% block version %}
3.1.3
{% endblock %}

{% block fetch %}
https://cache.ruby-lang.org/pub/ruby/3.1/ruby-{{self.version().strip()}}.tar.gz
5ea498a35f4cd15875200a52dde42b6eb179e1264e17d78732c3a57cd1c6ab9e
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
shut_up
wrap_cc
wrap_rdynamic
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
