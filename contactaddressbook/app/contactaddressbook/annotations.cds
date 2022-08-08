using CatalogService as service from '../../srv/cat-service';

annotate service.ContactAddressBook with @(
  UI: {
    SelectionFields : [
        TEMPLATE_ID,
        FIRST_NAME1,
        COUNTRY_code
    ],

    LineItem : [
        // {
        //     $Type  : 'UI.DataFieldForAction',
        //     Action : 'service.ChangeTemplateID',
        //     Label  : 'Change Template ID',
        // },
        {
            $Type : 'UI.DataField',
            Label : 'TEMPLATE ID',
            Value : TEMPLATE_ID,
            ![@HTML5.CssDefaults] : {width : '10rem'}

        },
        {
            $Type : 'UI.DataField',
            Label : 'FIRST NAME',
            Value : FIRST_NAME,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            $Type : 'UI.DataField',
            Label : 'LAST NAME',
            Value : LAST_NAME,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            $Type : 'UI.DataField',
            Label : 'PHONE NUMBER',
            Value : PHONE_NUMBER,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            $Type : 'UI.DataField',
            Label : 'PRIMARY MAIL',
            Value : PRIMARY_MAIL,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
        {
            $Type : 'UI.DataField',
            Label : 'Country Code',
            Value : COUNTRY_code,
            ![@HTML5.CssDefaults] : {width : '10rem'}
        },
    ],

    HeaderInfo  : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : '{i18n>workItem}',
        TypeNamePlural : '{i18n>workItems}',
        Title          : {Value : FIRST_NAME},
        Description    : {Value : TEMPLATE_ID}
    },
  }

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
                Label : 'TEMPLATE ID',
                Value : TEMPLATE_ID,
            },
            
        ],
    },
    UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'FIRST NAME',
                Value : FIRST_NAME,
            },
            {
                $Type : 'UI.DataField',
                Label : 'LAST NAME',
                Value : LAST_NAME,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Gender',
                Value : GENDER,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Country Code',
                Value : COUNTRY_code,
            }
        ],
    },
    UI.FieldGroup #GeneratedGroup3 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'PHONE NUMBER',
                Value : PHONE_NUMBER,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PRIMARY MAIL',
                Value : PRIMARY_MAIL,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SECONDARY MAIL',
                Value : SECONDARY_MAIL,
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
         {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'User Information',
            Target : '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet3',
            Label : 'Contact Details',
            Target : '@UI.FieldGroup#GeneratedGroup3',
        },
    ]
);

//Mandatory
annotate service.ContactAddressBook {
    TEMPLATE_ID          @mandatory;
    //ID                   @readonly;
    FIRST_NAME           @mandatory;
    LAST_NAME            @mandatory;
    PHONE_NUMBER         @mandatory;
    PRIMARY_MAIL         @mandatory;
    //GENDER  @mandatory;
};

//Hide
annotate service.ContactAddressBook with @Capabilities : {FilterRestrictions : {
    $Type                   : 'Capabilities.FilterRestrictionsType',
    NonFilterableProperties : [
        TEMPLATE_ID,
        FIRST_NAME,
    ]
}};

//Drop Down using data from genders table
annotate service.ContactAddressBook with {
    GENDER @(Common : {ValueListWithFixedValues,
        ValueList : {
        CollectionPath  : 'Genders',
        SearchSupported : true,
        Label           : 'Gender',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : GENDER,
                ValueListProperty : 'genderType'
            },
            // {
            //     $Type             : 'Common.ValueListParameterDisplayOnly',
            //     ValueListProperty : 'genderType'
            // }
        ]
    }});
}

//Value help using data from COUNTRY table
annotate service.ContactAddressBook with {
    COUNTRY_code @(Common : {
        ValueList : {
        CollectionPath  : 'ContactAddressBook',
        SearchSupported : true,
        Label           : 'Country',
        Parameters      : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : COUNTRY_code,
                ValueListProperty : 'COUNTRY_code'
            },
            
        ]
    }});
}


//DropDown
// annotate service.ContactAddressBook with {
//     TO_GENDER @(Common : {
//         ValueListWithFixedValues,
//         ValueList : {
//             CollectionPath : 'Genders',
//             Label          : 'Gender',
//             Parameters     : [{
//                 $Type             : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : 'GENDER',
//                 ValueListProperty : 'genderType'
//             }]
//        }
//     });
// };

//value Help for fields
annotate service.ContactAddressBook with {
    FIRST_NAME1 @(Common : {
        ValueList : {
        CollectionPath : 'ContactAddressBook',
        Label          : 'First Name',
        SearchSupported : true,
        Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'FIRST_NAME1',
                ValueListProperty : 'FIRST_NAME'
            },
        ]
    }});
};





