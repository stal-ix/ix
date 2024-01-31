{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/magiblot/turbo
{% endblock %}

{% block git_commit %}
45a02f7de283b404e3be40712adf0f125bda4641
{% endblock %}

{% block git_sha %}
9c398bb6b68e8b9e656479a526c482378cd74204b662959faa3cbc1e8207e559
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
TURBO_OPTIMIZE_BUILD=OFF
TURBO_USE_SYSTEM_DEPS=ON
TURBO_USE_SYSTEM_TVISION=ON
{% endblock %}
