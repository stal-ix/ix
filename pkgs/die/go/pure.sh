{% extends 'c.sh' %}

{% block bld_data %}
die/go/vendor.sh(url={{self.go_url().strip()}},sum={{self.go_sum().strip()}},sha={{self.go_sha().strip()}},parent_id={{uniq_id}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
