{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mobile-shell/mosh/archive/refs/tags/mosh-1.4.0.tar.gz
sha:ae581fbddf038730af9eee4d319a483288395a0722d0c94c7efb7fdbdbb0dbac
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
