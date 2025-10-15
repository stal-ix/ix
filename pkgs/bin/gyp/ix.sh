{% extends '//die/std/ix.sh' %}

{% block git_repo %}
https://chromium.googlesource.com/external/gyp
{% endblock %}

{% block git_commit %}
1615ec326858f8c2bd8f30b3a86ea71830409ce4
{% endblock %}

{% block git_sha %}
27bae2707dad28020df033fd9052434baf0d1135f5a976b408f481d6d8a2dd6f
{% endblock %}

{% block bld_tool %}
pip/six
bld/python
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
