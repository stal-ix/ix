{% extends '//bin/sbcl/t/ix.sh' %}

{% block fetch %}
https://nav.dl.sourceforge.net/project/sbcl/sbcl/2.3.0/sbcl-2.3.0-source.tar.bz2
sha:bf743949712ae02cb7493f3b8b57ce241948bf61131e36860ddb334da1439c97
{% endblock %}

{% block bld_tool %}
bld/sbcl
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/zstd
{{super()}}
{% endblock %}

{% block boot_lisp %}
sbcl
{% endblock %}

{% block extern_symbols %}
{{super()}}
{# llvm-nm --extern-only --defined-only *.o | grep ' ' | sed -e 's|.* ||' | sort #}
{% include 'sbcl' %}
{% endblock %}
