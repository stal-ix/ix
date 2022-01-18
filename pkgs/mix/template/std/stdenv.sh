{% block shell %}
dev/tool/sh
{% endblock %}

{% block box %}
gnu/box
{% endblock %}

{% block decompressor %}
dev/tool/extract(std_box=bin/bootbox,opt=fast)
{% endblock %}
