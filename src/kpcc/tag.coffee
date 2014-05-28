class kpcc.Tag extends kpcc.ApiEntity
    @ENDPOINT       = "tags"
    @KEY_SINGULAR   = "tag"
    @KEY_PLURAL     = "tags"

    attributes: [
        "title"
        "slug"
    ]

    @all = @default
