class kpcc.ApiEntity extends kpcc.Entity
    # These must be overridden
    @ENDPOINT       = null
    @KEY_PLURAL     = null
    @KEY_SINGULAR   = null


    @query: (params={}, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT)
            data: params

            success: (data, textStatus, jqXHR) =>
                @_collection_cb(data, cb)


    @find: (id, cb) ->
        @_ajax
            url: kpcc.api_url(@ENDPOINT, id)

            success: (data, textStatus, jqXHR) =>
                @_singular_cb(data, cb)


    @_singular_cb: (data, cb) ->
        obj = new @(data[@KEY_SINGULAR])
        cb.bind(obj)()

    @_collection_cb: (data, cb) ->
        collection = []

        for obj in data[@KEY_PLURAL]
            collection.push new @(obj)

        cb.bind(collection)()

    @_ajax: (attributes) ->
        $.ajax $.extend({ type: "GET", dataType: "json" }, attributes)
