class kpcc.Abstract extends kpcc.Entity
    attributes = [
        "source"
        "url"
        "headline"
        "summary"
        "article_published_at"
    ]

    nested_objects = [
        "assets"
        "audio"
        "category"
    ]
