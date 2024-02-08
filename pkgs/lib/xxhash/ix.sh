{% extends 't/ix.sh' %}

{% block bld_tool %}
{{super()}}
bld/wrapcc
bld/rename/dynlib
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-xxhash=${out} --with-libxxhash-prefix=${out} \${COFLAGS}"
{% endblock %}
