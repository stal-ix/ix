{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block go_url %}
https://github.com/moriyoshi/s3-sftp-proxy/archive/d292467c629fd57c6d8471b324d8987a734b8c99.zip
{% endblock %}

{% block go_sha %}
e91925e8ab9bf65324d66f2655a46437af4418ce881402ff8b3237899b7b5271
{% endblock %}

{# predates Go modules: no go.mod upstream #}
{% block go_refine %}
go mod init github.com/moriyoshi/s3-sftp-proxy
{% endblock %}

{% block go_bins %}
s3-sftp-proxy
{% endblock %}
