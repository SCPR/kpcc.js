window.kpcc = {
    API_ROOT: "http://www.scpr.org/api/v3/"

    NESTED_OBJECTS: {
        "articles"      : { klass: "Article", plural: true }
        "segments"      : { klass: "Article", plural: true }
        "abstracts"     : { klass: "Abstract", plural: true }
        "category"      : { klass: "Category", plural: true }
        "assets"        : { klass: "Asset", plural: true }
        "audio"         : { klass: "Audio", plural: true }
        "attributions"  : { klass: "Attribution", plural: true }
        "tags"          : { klass: "Tag", plural: true }
        "program"       : { klass: "Program", plural: false }
        "location"      : { klass: "Location", plural: false }
        "sponsor"       : { klass: "Sponsor", plural: false }
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
                cb.bind(data)(data["meta"])

}
