class kpcc.ApiEntity extends kpcc.Entity
    # These must be overridden
    @ENDPOINT       = null
    @KEY_PLURAL     = null
    @KEY_SINGULAR   = null

    @query: (params={}, cb) ->
        $.ajax
            type: "GET"
            dataType: "json"
            url: kpcc.api_url(@ENDPOINT)
            data: params

            success: (data, textStatus, jqXHR) =>
                collection = []

                for obj in data[@KEY_PLURAL]
                    collection.push new @(obj)

                cb.bind(collection)()


    @find: (id, cb) ->
        $.ajax
            type: "GET"
            dataType: "json"
            url: kpcc.api_url(@ENDPOINT, id)

            success: (data, textStatus, jqXHR) =>
                obj = new @(data[@KEY_SINGULAR])
                cb.bind(obj)()
