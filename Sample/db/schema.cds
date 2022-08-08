namespace sap.capire.sample;
using { managed } from '@sap/cds/common';

entity CONTACT_ADDRESS_BOOK : managed {
    Key ID : UUID;
    TEMPLATE_ID  : String   @title : 'Template ID';
    FIRST_NAME   : String(256) @title : 'First Name';
    LAST_NAME    : String(256) @title : 'Last Name';
    PHONE_NUMBER : String(50)  @title : 'Phone Number';
    PRIMARY_MAIL : String(64)  @title : 'Primary Mail';
    SECONDARY_MAIL  : String(64)  @title : 'Secondary Mail';
    GENDER : String @title : 'Gender';
    COUNTRY : String @title : 'Country';
    LINK_TO_GENDERS :  Association[1..1] to GENDERS on LINK_TO_GENDERS.genderType = GENDER;
    LINK_TO_COUNTRY :  Association[1..1] to NATIONALITY on LINK_TO_COUNTRY.zcountry = COUNTRY;
}

entity GENDERS {
    Key genderType : String  @title : 'Gender';
}

entity NATIONALITY{
    key zcountry : String @title : 'Country'
}