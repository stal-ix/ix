{% extends '//die/c/ix.sh' %}

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

{% set go_tags %}{% block go_tags %}{% endblock %}{% endset %}

{% set go_command %}
go build

{% if go_tags %}
-tags
{{','.join(ix.parse_list(go_tags))}}
{% endif %}

-p ${make_thrs}

{% if verbose %}
-v
{% endif %}

{% block go_build_flags %}
{% endblock %}
{% endset %}

{% block build %}
{{ix.fix_list(go_command)}}
{% endblock %}
