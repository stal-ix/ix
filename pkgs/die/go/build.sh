{% extends 'base.sh' %}

{% block std_box %}
bld/stable/unpack
{{super()}}
{% endblock %}

{% block unpack %}
mkdir src
cd src
stable_unpack ${src}/*lz4
{% endblock %}

{% block go_refine %}
{% endblock %}

{% block bld_data %}
aux/go(url={{self.go_url().strip()}},sha={{self.go_sha().strip()}},parent_id={{self.go_sha().strip()}},go_refine={{self.go_refine().strip() | b64e}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
