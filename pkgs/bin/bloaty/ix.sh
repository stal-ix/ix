{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/google/bloaty
{% endblock %}

{% block git_commit %}
379d5305670c00c36a57e608079fd253f13bde63
{% endblock %}

{% block git_sha %}
f9670cd3faa88090de03bef8a8c3a994f4fae0b17b3d18c74ef418f4690d3fe6
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/re2
lib/cap/stone
lib/protobuf
{% endblock %}

{% block bld_tool %}
bin/protoc
{% endblock %}

