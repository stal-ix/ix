{% extends 'c_std.sh' %}

{% block std_box %}
{% block go_compiler %}
bin/go
{% endblock %}
{{super()}}
{% endblock %}

{% block step_setup %}
export GOCACHE=${tmp}/cgo
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{{super()}}
{% endblock %}

{% set go_tags %}
{% block go_tags %}
x
{% endblock %}
{% endset %}

{% block build %}
go build -tags {{','.join(ix.parse_list(go_tags))}}
{% endblock %}
