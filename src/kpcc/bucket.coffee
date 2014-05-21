class kpcc.Bucket extends kpcc.ApiEntity
    @ENDPOINT       = "buckets"
    @KEY_SINGULAR   = "bucket"
    @KEY_PLURAL     = "buckets"

    attributes: [
        "title"
        "slug"
        "updated_at"
    ]

    nested_objects: [
        "articles"
    ]
