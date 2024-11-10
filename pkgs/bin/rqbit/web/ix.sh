{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/ikatson/rqbit/archive/refs/tags/v7.0.1.tar.gz
sha:78f4e27da1f63a63e48b8fcd813d5e25db62971b74072fbbf055e9241d3514b3
{% endblock %}

{% block bld_tool %}
bld/npm
{% endblock %}

{% block build %}
(
cd desktop
npm install
)
(
cd crates/librqbit/webui
npm install
)
{% endblock %}
