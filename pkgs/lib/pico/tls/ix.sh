{% extends '//die/c/cmake.sh' %}

{# no install target #}

{% block git_repo %}
https://github.com/h2o/picotls
{% endblock %}

{% block git_commit %}
89fe56f4d79200a5801a08ed3b6ac8322e01ccd5
{% endblock %}

{% block git_sha %}
86935f9185e681591ac09a752382752ad10d149100d3278ba693bc3958ea834c
{% endblock %}

{% block lib_deps %}
lib/c
lib/openssl
{% endblock %}

