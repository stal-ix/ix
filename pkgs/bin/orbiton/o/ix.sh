{% extends '//die/go/build.sh' %}

{% block go_url %}
{% include '//bin/orbiton/g/ver.sh' %}
{% endblock %}

{% block go_sha %}
e1a85c26cb5d51374954b1546ae61618774d2e1bcda32734a680179308da100a
{% endblock %}

{% block go_tool %}
bin/go/lang/23
{% endblock %}

{% block unpack %}
{{super()}}
cd v2
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp orbiton ${out}/bin/o
{% endblock %}
