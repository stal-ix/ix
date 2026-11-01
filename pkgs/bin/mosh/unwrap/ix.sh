{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
mosh
{% endblock %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/mobile-shell/mosh/archive/refs/tags/mosh-{{self.version().strip()}}.tar.gz
ae581fbddf038730af9eee4d319a483288395a0722d0c94c7efb7fdbdbb0dbac
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/curses
lib/openssl
lib/protobuf
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

{% block cxx_flags %}
-std=c++20
{% endblock %}

{% block patch %}
# shared_ptr::unique() is gone in C++20, which protobuf's headers need
sed -e 's|mutable_row.unique()|(mutable_row.use_count() == 1)|' \
    -i src/terminal/terminalframebuffer.h
{% endblock %}
