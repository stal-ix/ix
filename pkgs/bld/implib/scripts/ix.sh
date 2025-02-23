{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/yugr/Implib.so/archive/91095d7c52742edf775aba410eb1bb4afbecfc38.zip
sha:135e34016f0fe7ad8e0d2a91fd039616feed23c2ecc9d2483cdb0bda0a245701
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir ${out}/bin
cd ${out}/bin
extract 1 ${src}/91095d7c52742edf775aba410eb1bb4afbecfc38.zip
chmod +x implib-gen.py
{% endblock %}
