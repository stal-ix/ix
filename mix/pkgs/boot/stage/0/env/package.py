def package(mix):
    deps = [
        'boot/stage/0/mix',
        #'boot/stage/0/{{mix.platform.target.os}}',
    ]

    return {
        'build': {
            'script': mix.files.build_py,
            'depends': deps,
        },
        'runtime': {
            'depends': deps + [
                'env/system',
                'env/compiler',
                'env/bootstrap',
            ],
        },
    }
