{% block shell %}
dev/tool/sh
{% endblock %}

{% block box %}
gnu/box
{% endblock %}

{% block decompressor %}
dev/tool/extract(std_box=box/boot,opt=fast)
{% endblock %}
