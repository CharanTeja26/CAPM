using CatalogService as service from '../../srv/cat-service';

annotate service.ContactAddressBook with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : TEMPLATE_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : FIRST_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : LAST_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PHONE_NUMBER,
        },
    ]
);
annotate service.ContactAddressBook with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : TEMPLATE_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : FIRST_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : LAST_NAME,
            },
            {
                $Type : 'UI.DataField',
                Value : PHONE_NUMBER,
            },
            {
                $Type : 'UI.DataField',
                Value : PRIMARY_MAIL,
            },
            {
                $Type : 'UI.DataField',
                Value : SECONDARY_MAIL,
            },
            {
                $Type : 'UI.DataField',
                Value : GENDER,
            },
            {
                $Type : 'UI.DataField',
                Value : COUNTRY,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
