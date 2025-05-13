{% extends '//die/fonts.sh' %}

{% block pkg_name %}
intel-one-mono
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://github.com/intel/intel-one-mono/releases/download/V{{self.version().strip()}}/otf.zip
sha:44127021492601921168811653115995131f15350574b6c708c4646a0534814d
{% endblock %}
