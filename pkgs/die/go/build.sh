{% extends 'base.sh' %}

{% block std_box %}
bld/stable/unpack
{{super()}}
{% endblock %}

{% block go_version %}
v1
{% endblock %}

{% block go_unpack %}
stable_unpack
{% endblock %}

{% block unpack %}
mkdir src
cd src
{{self.go_unpack().strip()}} ${src}/*lz4
{% endblock %}

{% block go_refine %}
{% endblock %}

{% block bld_data %}
aux/go/{{self.go_version().strip()}}(url={{self.go_url().strip()}},sha={{self.go_sha().strip()}},parent_id={{self.go_sha().strip()}},go_refine={{self.go_refine().strip() | b64e}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
