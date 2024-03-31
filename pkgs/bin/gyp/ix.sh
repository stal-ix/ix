{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/external/gyp
{% endblock %}

{% block git_commit %}
d6c5dd51dc3a60bf4ff32a5256713690a1a10376
{% endblock %}

{% block git_sha %}
7a6b73d97878eeb2ae967a9bb5b62bea7529f791007430a322a98c12f04bf99f
{% endblock %}

{% block bld_tool %}
bld/python/2
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp -R ../src ${out}/bin/bin_gyp
base64 -d << EOF > ${out}/bin/gyp
{% include 'gyp/base64' %}
EOF
chmod +x ${out}/bin/gyp
{% endblock %}

{% block test %}
${out}/bin/gyp --help
{% endblock %}

{% block git_version %}
v3
{% endblock %}
