{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/varjolintu/keepassxc
{% endblock %}

{% block git_commit %}
be87c0fc06ca61fcc6151e615e6e519f084f5360
{% endblock %}

{% block git_sha %}
8bb8316b066f512f97ffd8aaa143b2b1f602df649a7f071be3caf37d7fa6460c
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/botan
lib/qt/6/base
lib/qt/6/deps
lib/qt/6/compat
{% endblock %}
