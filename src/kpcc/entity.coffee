class kpcc.Entity
    attributes      : []
    nested_objects  : []

    constructor: (json) ->
        for attribute in @attributes
            @[attribute] = json[attribute]

        for key in @nested_objects
            if klass = kpcc.NESTED_OBJECTS[key]
                @[key] = new kpcc[klass](json[key])
