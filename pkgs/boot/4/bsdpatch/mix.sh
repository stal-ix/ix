{% extends '//mix/template/template.sh' %}

{% block fetch %}
# url https://opensource.apple.com/tarballs/patch_cmds/patch_cmds-17.tar.gz
# md5 4740086061c91069efcfbf4fde458ead
{% endblock %}

{% block bld_deps %}
boot/3/env/mix.sh
{% endblock %}

{% block postunpack %}
cd patch
{% endblock %}

{% block build %}
clang -o patch *.c
{% endblock %}

{% block install %}
mkdir ${out}/bin && cp patch ${out}/bin/
{% endblock %}
