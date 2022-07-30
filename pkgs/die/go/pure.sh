{% extends 'c.sh' %}

{% block std_box %}
{{super()}}
aux/vendor/go(url={{self.go_url().strip()}},sum={{self.go_sum().strip()}})
{% endblock %}

{% block go_build_flags %}
{{super()}}
-mod=readonly
{% endblock %}
