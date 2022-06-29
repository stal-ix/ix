{% extends 'c_std.sh' %}

{% block std_box %}
bin/waf
bld/python
bld/pkg/config
{{super()}}
{% endblock %}

{% block step_patch %}
find . -type f -name waf | while read l; do
    rm -rf ${l}
done

find . -type d -name waflib | while read l; do
    rm -rf ${l}
done

find . -type f -name wscript | while read l; do
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
cp $(which waf) ./
python3 waf configure {{ix.fix_list(waf_flags)}}
{% endblock %}

{% block build %}
python3 waf build
{% endblock %}

{% block install %}
python3 waf install
{% endblock %}
