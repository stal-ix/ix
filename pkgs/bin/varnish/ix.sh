{% extends '//die/c/autorehell.sh' %}

{# broken libtool #}

{% block fetch %}
https://github.com/varnishcache/varnish-cache/archive/refs/tags/varnish-7.6.0.tar.gz
sha:7565fe0311043b58a2e86191d85ea6c015c12169b5f021333fb31939c0984928
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

