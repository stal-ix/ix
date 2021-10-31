def package(mix):
    deps = [
        'boot/stage/0/mix/package.py',
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
                'env/compiler/package.py',
                'env/bootstrap/package.py',
            ],
        },
    }
