{% extends 'c_std.sh' %}

{% block std_box %}
bld/python
bld/pkg/config
{{super()}}
{% endblock %}

{% set waf %}{% block waf %}waf{% endblock %}{% endset %}

{% block step_patch %}
find . -type f -name wscript | while read l; do
    sed -e 's|cshlib|cstlib|g'     \
        -e 's|cxxshlib|cxxstlib|g' \
        -e 's|stdc++|c|g'          \
        -i "${l}"
done

# TODO(pg): check another projects
find . -type f | while read l; do
    sed -e 's|Bdynamic|Bstatic|g' -i "${l}"
done

{{super()}}
{% endblock %}

{% set waf_flags %}
--prefix="${out}"
{% block waf_flags %}
{% endblock %}
{% endset %}

{% block configure %}
{% if help %}
python3 {{waf}} --help
exit 1
{% else %}
python3 {{waf}} configure {{ix.fix_list(waf_flags)}}
{% endif %}
{% endblock %}

{% block build %}
python3 {{waf}} build
{% endblock %}

{% block install %}
python3 {{waf}} install
{% endblock %}
