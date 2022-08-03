{% extends 'c.sh' %}

{% block std_box %}
bin/lz4
{{super()}}
{% endblock %}

{% block unpack %}
mkdir src; cd src
lz4 -d ${src}/*lz4 - | bsdtar -x -f - --no-same-permissions --no-same-owner --strip-components 1
{% endblock %}

{% block bld_data %}
die/go/vendor.sh(url={{self.go_url().strip()}},sum={{self.go_sum().strip()}},sha={{self.go_sha().strip()}},parent_id={{uniq_id}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
