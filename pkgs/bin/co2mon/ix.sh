{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/dmage/co2mon
{% endblock %}

{% block git_commit %}
6d70750d2140760e23a5d1a4a2cf37f7248d103a
{% endblock %}

{% block git_sha %}
4eec730f44e47af7df6bd47d2eb1fd3edc51c3836f3cd9186ebcb77a4747a42d
{% endblock %}

{% block bld_libs %}
lib/c
lib/hid/api
{% endblock %}
