{% extends 'c.sh' %}

{% block std_box %}
{{super()}}
die/go/vendor.sh(url={{self.go_url().strip()}},sum={{self.go_sum().strip()}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=vendor
{% endblock %}
