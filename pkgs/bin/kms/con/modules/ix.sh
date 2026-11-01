{% extends '//bin/kms/con/stock/ix.sh' %}

# check bin/kms/con

{% block bld_tool %}
{{super()}}
bld/librarian
bld/wrap/cc/plugins/rdynamic/fake
{% endblock %}

{% block build_flags %}
{{super()}}
wrap_cc
{% endblock %}

{% block install %}
mkdir ${out}/lib
{% for m in self.modules() | parse_list %}
cp ${tmp}/lib/mod-{{m}}.a ${out}/lib/libmod{{m}}.a
patchns ${out}/lib/libmod{{m}}.a {{m}}_
{% endfor %}
{% endblock %}
