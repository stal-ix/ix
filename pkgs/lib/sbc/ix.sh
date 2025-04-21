{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
sbc
{% endblock %}

{% block version %}
2.0
{% endblock %}

{% block git_repo %}
https://kernel.googlesource.com/pub/scm/bluetooth/sbc
{% endblock %}

{% block git_branch %}
{{self.version().strip()}}
{% endblock %}

{% block git_sha %}
14acd73967509f76393204656187ca2257cff7fc8066ad07286d87033c28313a
{% endblock %}

{% block lib_deps %}
lib/c
lib/sndfile
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}
