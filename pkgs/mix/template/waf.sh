{% extends 'c_std.sh' %}

{% block std_box %}
dev/tool/python
bin/pkg-config
{{super()}}
{% endblock %}

{% block step_patch %}
find . | grep wscript | while read l; do
    sed -e 's|cshlib|cstlib|g'     \
        -e 's|cxxshlib|cxxstlib|g' \
        -e 's|stdc++|c|g'          \
        -i ${l}
done

# TODO(pg): check another projects
find . -type f | while read l; do
    sed -e 's|Bdynamic|Bstatic|g' -i ${l}
done

{{super()}}
{% endblock %}

{% set waf_flags %}
--prefix="${out}"
{% block waf_flags %}
{% endblock %}
{% endset %}

{% block configure %}
python3 waf configure {{mix.fix_list(waf_flags)}}
{% endblock %}

{% block build %}
python3 waf build
{% endblock %}

{% block install %}
python3 waf install
{% endblock %}
