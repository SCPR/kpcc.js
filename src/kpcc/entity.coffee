class kpcc.Entity
    attributes      = []
    nested_objects  = []

    constructor: (json) ->
        for attribute in @attributes
            @[attribute] = json[attribute]

        for attribute of @nested_objects
            @[key] = new kpcc.NESTED_OBJECTS[attribute](json[attribute])
