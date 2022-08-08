namespace sap.CONTACTADDRESSBOOK;
using { Country } from '@sap/cds/common';

type Gender : String enum { male; female; }
entity CONTACT_ADDRESS_BOOK {
    Key ID : UUID;
    TEMPLATE_ID  : String   @title : 'Template ID';
    //TEMPLATE_ID1  : String   @title : 'Template ID';
    FIRST_NAME   : String(256) @title : 'First Name';
    FIRST_NAME1  : String(256) @title : 'First Name';
    LAST_NAME    : String(256) @title : 'Last Name';
    PHONE_NUMBER : String(50)  @title : 'Phone Number' @Communication.IsPhoneNumber;
    PRIMARY_MAIL : String(64)  @title : 'Primary Mail' @Communication.IsEmailAddress;
    SECONDARY_MAIL  : String(64)  @title : 'Secondary Mail';
    GENDER : String @title : 'Gender';
    COUNTRY : Country @title : 'Country';
    LINK_TO_GENDERS :  Association[1..1] to GENDERS on LINK_TO_GENDERS.genderType = GENDER;
    //LINK_TO_COUNTRY :  Association[1..1] to NATIONALITY on LINK_TO_COUNTRY.zcountry = COUNTRY;
}

entity GENDERS {
    Key genderType : String  @title : 'Gender';
}

// entity NATIONALITY{
//     key zcountry : String @title : 'Country'
// }