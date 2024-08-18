{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/iovisor/ubpf
{% endblock %}

{% block git_commit %}
19cd22c6fbe2878898717308d5792d49bff34d3e
{% endblock %}

{% block git_sha %}
47df28dc1c34af61369f428d26e66fcec9478a4795b503a90bd1ba642238833c
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block cmake_flags %}
UBPF_ENABLE_INSTALL=ON
{% endblock %}
