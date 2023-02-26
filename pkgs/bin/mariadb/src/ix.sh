{% extends '//die/proxy.sh' %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tar.lz4", "sum": "74ef5fd2d9d4431f0dfe94ccbf14c0a16a9a61efee98b534a5c2f7998bad320d"}]
{% endblock %}

{% block bld_tool %}
bin/git
bin/tar
bin/lz4
{% endblock %}

{% block build %}
git clone --recurse-submodules --shallow-submodules --depth 1 --branch mariadb-10.11.2 https://github.com/MariaDB/server.git
find . -type d -name '.git' | while read l; do
    rm -rf "${l}"
done
tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01'  -c -f {{parent_id}}.tar server
{% endblock %}

{% block install %}
mkdir ${out}/share
lz4 {{parent_id}}.tar ${out}/share/{{parent_id}}.tar.lz4
ls -la ${out}/share/
{% endblock %}

{% block postinstall %}
:
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
