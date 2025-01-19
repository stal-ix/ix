{% extends '//die/go/build.sh' %}

{% block go_url %}
{% include '//bin/orbiton/g/ver.sh' %}
{% endblock %}

{% block go_sha %}
21aea7bfed3d6fe6d73de04338b488f2aad87933b4e6143264de5af100a3014c
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
