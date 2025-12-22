{% extends '//die/c/ix.sh' %}

{% block go_tool %}
{% endblock %}

{% block std_box %}
{{self.go_tool().strip() or 'bin/go/lang'}}
{{super()}}
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block step_setup %}
{% if mingw32 %}
export GOOS=windows
{% else %}
export GOOS={{target.os}}
{% endif %}
export GOARCH={{target.go_arch}}
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
{{go_tags | parse_list | fjoin(',')}}
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
