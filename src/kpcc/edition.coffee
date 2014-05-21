class kpcc.Edition extends kpcc.ApiEntity
    @ENDPOINT       = "editions"
    @KEY_SINGULAR   = "edition"
    @KEY_PLURAL     = "editions"

    attributes = [
        "id"
        "title"
        "published_at"
    ]

    nested_objects = [
        "abstracts"
    ]
