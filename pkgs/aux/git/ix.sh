{% extends '//die/proxy.sh' %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tar.lz4", "sum": "{{sha}}"}]
{% endblock %}

{% block bld_tool %}
bin/git
bin/tar
bin/lz4
{% endblock %}

{% block build %}
mkdir git
cd git
git clone --recurse-submodules --shallow-submodules --depth 1 --branch {{branch}} {{repo}}
find . -type d -name '.git' | while read l; do
    rm -rf "${l}"
done
tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01'  -c -f ../{{parent_id}}.tar *
{% endblock %}

{% block install %}
mkdir ${out}/share
lz4 {{parent_id}}.tar ${out}/share/{{parent_id}}.tar.lz4
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
