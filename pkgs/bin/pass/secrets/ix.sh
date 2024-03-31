{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/nullobsi/pass-secrets
{% endblock %}

{% block git_commit %}
9bf333ca0cd9c1d1788c5206c09570933d51da1d
{% endblock %}

{% block git_sha %}
accefcc8aa90eeae21168ecad684552eb6c32efb84c076106c979e4abb39fdde
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/sd/bus/c++
{% endblock %}

{% block bld_tool %}
bin/sd/bus/codegen
{% endblock %}
