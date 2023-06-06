{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/xz(std_box=bld/boot/box,intl_ver=no)
bld/tar
{% endblock %}

{% block env %}
extract() (
    bsdcat \${2} | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components \${1}
)
{% endblock %}
