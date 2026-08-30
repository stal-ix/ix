{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sbc
{% endblock %}

{% block version %}
2.2
{% endblock %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
66a6724933fd5466061cc85935b6f7388adf72f9e82dba72db96608b2a024c3c
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
