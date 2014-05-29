class kpcc.DataPoint extends kpcc.ApiEntity
    @ENDPOINT       = "data_points"
    @KEY_SINGULAR   = "data_point"
    @KEY_PLURAL     = "data_points"

    attributes: [
        "title"
        "group"
        "key"
        "value"
        "notes"
        "updated_at"
    ]

    # Override from ApiEntity because the response format could be different
    @query: (params={}, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT)
            data: params

            success: (data, textStatus, jqXHR) =>
                if params["response_format"] is "simple"
                    # Just return the object.
                    cb.bind(data[@KEY_PLURAL])(data["meta"])

                else
                    @_collection_cb(data, cb)
