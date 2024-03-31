{% extends '//aux/go/v2/ix.sh' %}

{% block fname %}
go_v3_{{parent_id}}.pzd
{% endblock %}

{% block packer %}stable_pack_v3{% endblock %}
