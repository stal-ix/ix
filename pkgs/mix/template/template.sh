{% extends 'base.sh' %}

{% block unpack %}
{% include 'blocks/unpack.sh' %}
{% endblock %}

{% block preconf %}
{% include 'blocks/preconf.sh' %}
{% endblock %}

{% set env %}
{% block env %}
{% endblock %}
{% endset %}

{% set toolconf %}
{% block toolconf %}
{% endblock %}
{% endset %}

{% block prepare_env %}
{% include 'blocks/env.sh' %}
{% endblock %}
