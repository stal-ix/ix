def package(mix):
    deps = [
        'boot/stage/0/mix/mix.sh',
        #'boot/stage/0/{{mix.platform.target.os}}',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps + [
                'env/system/mix.sh',
                'env/compiler/mix.sh',
                'env/bootstrap/mix.sh',
            ],
        },
    }
