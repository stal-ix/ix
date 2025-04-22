{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sbc
{% endblock %}

{% block version %}
2.1
{% endblock %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
2af6b9b963c174e65a79d655ba8bf2a9441af9e24cb77f0c1df9058b50958e31
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
