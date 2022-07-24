{% extends '//die/c/c_std.sh' %}

{% block std_box %}
bld/scripts/inline
{{super()}}
{% endblock %}

{% block unpack %}
mkdir src; cd src
{% endblock %}

{% set sources %}
{% block sources %}
{% endblock %}
{% endset %}

{% block build %}
{% for x in ix.parse_list(sources) %}
cat << EOF > {{x}}
{{ix.load_file(x)}}
EOF
{% endfor %}
inline_build
{% endblock %}

{% block install %}
inline_install ${out}
{% endblock %}
