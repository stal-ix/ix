{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/lz4
bin/tar
bin/git
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{parent_id}}.tar.lz4", "sum": "{{sha}}"}]
{% endblock %}

{% block build %}
git clone -n {{url}} src
cd src
git checkout {{rev}}
cd ..
rm -rf src/.git
tar --sort=name --owner=root:0 --group=root:0 --mtime='UTC 1970-01-01' -c -f ${tmp}/{{parent_id}}.tar src
{% endblock %}

{% block install %}
mkdir ${out}/share
lz4 ${tmp}/{{parent_id}}.tar ${out}/share/{{parent_id}}.tar.lz4
ls -la ${out}/share/
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
