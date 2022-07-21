{% extends 'c_std.sh' %}

{% block std_box %}
bld/ninja
{{super()}}
{% endblock %}

{% set ninja_build_dir %}{% block ninja_build_dir %}${tmp}/obj{% endblock %}{% endset %}

{% set ninja_build_targets %}
{% block ninja_build_targets %}
{% endblock %}
{% endset %}

{% set ninja_install_targets %}
{% block ninja_install_targets %}
install
{% endblock %}
{% endset %}

{% block build %}
ninja -C {{ninja_build_dir}} -j {% block ninja_threads %}${make_thrs}{% endblock %} {{ix.fix_list(ninja_build_targets)}}
{% endblock %}

{% block install %}
ninja -C {{ninja_build_dir}} {{ix.fix_list(ninja_install_targets)}}
{% endblock %}

{% block step_configure %}
{{super()}}

{% block sanitize_build_files %}
find ${tmp} -name build.ninja | while read l; do
    echo "sanitize ${l}"

    sed -e 's|/usr/include|/nowhere|g'      \
        -e 's|/usr/lib|/nowhere|g'          \
        -e 's|/nowhere[^ ]*lib[^ ]*\.so||g' \
        -e 's|/nowhere[^ ]*lib[^ ]*\.a||g'  \
        -i ${l}
done
{% endblock %}
{% endblock %}
