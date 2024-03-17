{% extends 'base.sh' %}

{% block std_box %}
bld/stable/unpack
{{super()}}
{% endblock %}

{% block go_version %}
v2
{% endblock %}

{% block unpack %}
mkdir src
cd src
stable_unpack_2 ${src}/*lz4
{% endblock %}

{% block go_refine %}
{% endblock %}

{% block go_tool %}
bin/go/lang/21
{% endblock %}

{% block bld_data %}
aux/go/{{self.go_version().strip()}}(url={{self.go_url().strip()}},sha={{self.go_sha().strip()}},parent_id={{self.go_sha().strip()}},go_refine={{self.go_refine().strip() | b64e}},go_tool={{self.go_tool().strip()}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
