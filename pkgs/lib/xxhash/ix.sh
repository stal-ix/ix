{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/wrap/cc
bld/rename/dynlib
bld/wrap/cc/plugins/rdynamic/fake
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
