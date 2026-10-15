{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/google/bloaty
{% endblock %}

{% block git_commit %}
379d5305670c00c36a57e608079fd253f13bde63
{% endblock %}

{% block git_sha %}
e5718cb646ab262aa9c10ee623f75bf60f0107e3534b3c908c368216d8e7d40e
{% endblock %}

{% block git_version %}
v4
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
