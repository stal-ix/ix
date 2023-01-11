{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://tukaani.org/xz/xz-5.4.1.tar.xz
sha:5d9827aa1875b21c288f78864bb26d2650b436ea8d2cad364e4921eb6266a5a5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
