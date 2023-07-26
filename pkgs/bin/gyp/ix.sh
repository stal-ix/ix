{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/external/gyp
{% endblock %}

{% block git_commit %}
d6c5dd51dc3a60bf4ff32a5256713690a1a10376
{% endblock %}

{% block git_sha %}
f2a5d728e0c030cec335d49ba88eda2a1555646b63256ebfdf2612492a145537
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
