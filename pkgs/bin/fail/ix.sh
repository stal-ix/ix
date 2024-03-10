{% extends '//die/proxy.sh' %}

{% block json %}
{
    "qw": "we"
}
{% endblock %}

{% block install %}
echo {{(self.json() | jl)["qw"]}}
{% endblock %}
