{% extends 'ninja.sh' %}

{% block std_box %}
bin/gn
bld/python
bld/pkg/config
{{super()}}
{% endblock %}

{% block gn_flags %}
{% endblock %}

{% block configure %}
{% set gn_args %}
{% block gn_args %}
{% endblock %}
{% endset %}
gn gen {{ninja_build_dir}} {{self.gn_flags().strip().replace('\n', ' ')}} --args='{{ix.fix_list(gn_args)}}'
{% if help %}
gn args --list {{ninja_build_dir}}
exit 1
{% endif %}
{% endblock %}
