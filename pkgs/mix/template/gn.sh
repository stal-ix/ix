{% extends 'ninja.sh' %}

{% block std_box %}
bin/gn
bld/python
bin/pkg-config
{{super()}}
{% endblock %}

{% block configure %}
{% set gn_args %}
{% block gn_args %}
{% endblock %}
{% endset %}
gn gen {{ninja_build_dir}} --args='{{mix.fix_list(gn_args)}}'
{% endblock %}
