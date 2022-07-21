{% extends 'c_std.sh' %}

{% block std_box %}
{% block go_compiler %}
bin/go
{% endblock %}
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_setup %}
export GOCACHE=${tmp}/cgo
export GOMODCACHE=${tmp}/gmc
export GOPROXY="https://proxy.golang.org,direct"
export CPPFLAGS="-fno-color-diagnostics ${CPPFLAGS}"
{{super()}}
{% endblock %}

{% set go_tags %}
{% block go_tags %}
xxx
{% endblock %}
{% endset %}

{% set go_command %}
go
build
-tags
{{','.join(ix.parse_list(go_tags))}}
{% block go_build_flags %}
{% endblock %}
{% endset %}

{% block build %}
{{ix.fix_list(go_command)}}
{% endblock %}
