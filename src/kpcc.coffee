window.kpcc = {
    API_ROOT: "http://www.scpr.org/api/v3/"

    NESTED_OBJECTS: {
        "category"      : "Category"
        "assets"        : "Asset"
        "audio"         : "Audio"
        "attributions"  : "Attribution"
        "tags"          : "Tag"
        "program"       : "Program"
        "location"      : "Location"
        "sponsor"       : "Sponsor"
    }

    api_url: (parts...) ->
        return kpcc.API_ROOT + parts.join("/")

    # Generic method for querying the API.
    # This doesn't give you some of the automatic attribute assignment
    # of the built-in classes, but it will allow you to use brand new
    # API features before this lib has been updates.
    Query: (endpoint, params={}, cb) ->
        $.ajax
            type: "GET"
            dataType: "json"
            url: kpcc.api_url(endpoint)
            data: params

            success: (data, textStatus, jqXHR) =>
                cb.bind(data)()

}
