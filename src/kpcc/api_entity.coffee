class kpcc.ApiEntity extends kpcc.Entity
    # These must be overridden
    @ENDPOINT       = null
    @KEY_PLURAL     = null
    @KEY_SINGULAR   = null


    # Query an endpoint with parameters.
    @query: (params={}, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT)
            data: params

            success: (data, textStatus, jqXHR) =>
                @_collection_cb(data, cb)

    # Find an object by its ID.
    @find: (id, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, id)

            success: (data, textStatus, jqXHR) =>
                @_singular_cb(data, cb)

    # The default query when no parameters are passed.
    # This is here mostly so we can alias `all()` to it in
    # extended classes.
    @default: (cb) ->
        @query({}, cb)


    @_singular_cb: (data, cb) ->
        obj = new @(data[@KEY_SINGULAR])
        cb.bind(obj)(data["meta"])

    @_collection_cb: (data, cb) ->
        collection = []

        for obj in data[@KEY_PLURAL]
            collection.push new @(obj)

        cb.bind(collection)(data["meta"])

    @_ajax: (attributes) ->
        $.ajax $.extend({ type: "GET", dataType: "json" }, attributes)
