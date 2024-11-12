{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/abique/hefur
{% endblock %}

{% block git_commit %}
426634ba15879e267841745cddb82a045ee209ea
{% endblock %}

{% block git_sha %}
4a4d5214e03aadc0fe47c48aef102f3500f243dcffbe253f45b2b91099a78937
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/protoc
lib/gnutls
lib/archive
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bin/protoc
{% endblock %}
