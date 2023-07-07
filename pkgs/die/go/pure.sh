{% extends 'c.sh' %}

{% block std_box %}
bld/stable/unpack
{{super()}}
{% endblock %}

{% block unpack %}
mkdir src
cd src
stable_unpack ${src}/*lz4
{% endblock %}

{% block bld_data %}
die/go/vendor.sh(url={{self.go_url().strip()}},sum={{self.go_sum().strip()}},sha={{self.go_sha().strip()}},parent_id={{uniq_id}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
