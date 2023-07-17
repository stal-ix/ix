{% extends '//die/proxy.sh' %}

{% block bld_data %}
bld/npm/source
{% endblock %}

{% block bld_tool %}
bld/stable/unpack
{% endblock %}

{% block install %}
mkdir -p ${out}/bin/bin_npm
cd ${out}/bin/bin_npm
stable_unpack ${src}
cd ..
ln -s bin_npm/bin/npm-cli.js npm
{% endblock %}
