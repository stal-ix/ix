{% extends '//die/c/autorehell.sh' %}

{% block version %}
7.7.0
{% endblock %}

{# broken libtool #}

{% block fetch %}
https://github.com/varnishcache/varnish-cache/archive/refs/tags/varnish-{{self.version().strip()}}.tar.gz
sha:5c90b75e548585f940b6abee8a5805738698d70fb4e09780142953f9d72ac7a7
{% endblock %}

{% block bld_libs %}
lib/c
lib/edit
lib/pcre/2
lib/kernel
lib/execinfo
{% endblock %}

{% block bld_tool %}
bld/fake/er(tool_name=rst2man)
bld/fake/er(tool_name=rst2html)
bld/fake/er(tool_name=sphinx-build)
{% endblock %}

{% block build_flags %}
wrap_cc
no_werror
{% endblock %}
