{% extends '//lib/ffi/unix/ix.sh' %}

{% block fetch %}
{{super()}}
https://github.com/libffi/libffi/commit/8308bed5b2423878aa20d7884a99cf2e30b8daf7.diff
sha:501f9f03bbef62c693e19c01ffd8466fb6af6ab244fab70903bc85d1f3c86456
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 < ${src}/8308bed5b2423878aa20d7884a99cf2e30b8daf7.diff
{% endblock %}
