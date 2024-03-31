{% extends 'base.sh' %}

{% block std_box %}
bld/pzd
{{super()}}
{% endblock %}

{% block go_version %}
v3
{% endblock %}

{% block unpack %}
mkdir src; cd src
des ${src}/*.pzd .
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
