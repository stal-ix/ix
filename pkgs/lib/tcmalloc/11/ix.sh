{% extends '//lib/tcmalloc/t/ix.sh' %}

{% block fetch %}
https://github.com/gperftools/gperftools/archive/refs/tags/gperftools-2.11.tar.gz
sha:b0d32b3d82da0ddac2a347412b50f97efddeae66dfbceb49455b7262fb965434
{% endblock %}

{% block configure %}
{{super()}}
sed -e 's|.*HAVE_STRUCT_MALLINFO.*||' \
    -e 's|.*HAVE_SYS_CDEFS_H.*||' \
    -i ${tmp}/obj/config.h
{% endblock %}

{% block cpp_defines %}
{{super()}}
__environ=environ
{% endblock %}
