{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/turbo
{% endblock %}

{% block git_commit %}
45a02f7de283b404e3be40712adf0f125bda4641
{% endblock %}

{% block git_sha %}
6ccc112eaadb1042637396b27713f452b70bf0678b3e560ec60031874d6ca365
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/magic
lib/tvision
lib/clipboard
{% endblock %}

{% block cmake_flags %}
TURBO_USE_SYSTEM_DEPS=ON
TURBO_USE_SYSTEM_TVISION=ON
{% endblock %}
