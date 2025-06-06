{% extends '//die/hub.sh' %}

{% block run_deps %}
bin/huggingface/cli/scripts
bin/python/frozen(py_extra_modules=pip/huggingface_hub,py_binary_name=huggingface-bin)
{% endblock %}
