class kpcc.Article extends kpcc.ApiEntity
    @ENDPOINT       = "articles"
    @KEY_SINGULAR   = "article"
    @KEY_PLURAL     = "articles"

    attributes: [
        "id"
        "title"
        "short_title"
        "byline"
        "published_at"
        "teaser"
        "body"
        "public_url"
        "thumbnail"
    ]

    nested_objects: [
        "assets"
        "audio"
        "category"
        "attributions"
        "tags"
    ]


    @by_url: (url, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, "by_url")
            data:
                url: url

            success: (data, textStatus, jqXHR) =>
                @_singular_cb(data, cb)


    @most_viewed: (cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, "most_viewed")

            success: (data, textStatus, jqXHR) =>
                @_collection_cb(data, cb)


    @most_commented: (cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, "most_commented")

            success: (data, textStatus, jqXHR) =>
                @_collection_cb(data, cb)
