{% extends '//mix/template/c_std.sh' %}

{% block step_unpack %}
: nothing to unpack
{% endblock %}

{% set constructors %}
{% block constructors %}
{% endblock %}
{% endset %}

{% block build %}
cc -c -o reg.o -x c - << EOF
{% for x in mix.parse_list(constructors) %}
void {{x}}(void);
{% endfor %}

{% block definitions %}
{% endblock %}

__attribute__((constructor))
static void construct_{{uniq_id}}() {
{% for x in mix.parse_list(constructors) %}
    {{x}}();
{% endfor %}
}
EOF
{% endblock %}

{% block install %}
mkdir ${out}/lib; cp reg.o ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="${out}/lib/reg.o \${LDFLAGS}"
{% endblock %}
